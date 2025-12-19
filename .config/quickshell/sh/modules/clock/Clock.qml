import QtQuick
import Quickshell

import qs
import qs.services
import qs.components

Item {
    id: root

    height: 5
    width: 405

    readonly property real time_value: (TimeService.hours + TimeService.minutes / 60) / 24
    Flow {
        flow: Flow.LeftToRight
        spacing: 25

        ProgressLine {
            id: progress
            hcolor: Settings.c1
            bcolor: Settings.c2

            width: 400
            height: root.height
            value: time_value
            divisions: 24
            group: 3

            SunDot {
                id: sunrise
                value: SunriseService.sun_position.sunrise
                color: Settings.c3
                radius: 5
            }

            SunDot {
                id: solar_noon
                value: SunriseService.sun_position.solar_noon
                color: Settings.c3
                radius: 5
            }

            SunDot {
                id: sunset
                value: SunriseService.sun_position.sunset
                color: Settings.c3
                radius: 5
            }
        }

        ProgressLine {
            id: progress_minutes
            hcolor: Settings.c1
            bcolor: Settings.c2

            width: 100
            height: root.height
            value: (TimeService.minutes / 60)
            divisions: 6
            group: 3
        }
    }

    TimeHint {
        id: hint
        anchor {
            item: root
            rect.x: time_value * progress.width - hint.width / 2
        }
    }

    HoverHandler {
        onHoveredChanged: {
            if (hovered) {
                hint.visible = true;
            } else {
                hint.visible = false;
            }
        }
    }
}
