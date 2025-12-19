pragma ComponentBehavior: Bound

import QtQuick
import Quickshell
import qs.services
import qs.components

Item {
    id: root
    width: 400
    height: 350

    property Region region: Region {
        Region {
            item: panel
            intersection: Intersection.Combine
        }
        Region {
            item: hcorner
            intersection: Intersection.Combine
        }
    }

    NotificationIndicator {
        id: indicator
    }

    NotificationPanel {
        id: panel
        width: 400
        height: 350
        model: ScriptModel {
            values: [...NotificationService.notifications.map(a => a)]
        }
    }

    HoverHandler {
        id: handler

        onHoveredChanged: {
            if (!hovered)
                panel.collapse();
        }
    }

    HotCorner {
        id: hcorner
        anchors {
            right: parent.right
            bottom: parent.bottom
        }

        onHovered: {
            indicator.hide()
            panel.expand();
        }
    }
    Connections {
        target: NotificationService
        function onNewNotification() { indicator.show() }
    }
}
