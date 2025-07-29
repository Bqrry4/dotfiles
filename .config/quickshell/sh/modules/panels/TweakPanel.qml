import QtQuick
import Quickshell
import Quickshell.Widgets
import qs.components

Item {
    id: root

    width: hStrip.width
    height: vStrip.height

    function expand() {
        hStrip.expand();
        vStrip.expand();
    }

    function collapse() {
        hStrip.collapse();
        vStrip.collapse();
    }

    property Region region: Region {
        Region {
            item: hStrip
            intersection: Intersection.Combine
        }
        Region {
            item: vStrip
            intersection: Intersection.Combine
        }
    }

    Strip {
        id: vStrip

        color: "#030000"

        spacing: 8
        padding: 6

        orientation: Strip.Vertical

        anchors {
            left: parent.left
            bottom: parent.bottom
        }

        IconImage {
            source: Qt.resolvedUrl("../../icons/volume.svg")
            implicitSize: 22
        }

        IconImage {
            source: Qt.resolvedUrl("../../icons/mic.svg")
            implicitSize: 22
        }

        IconImage {
            source: Qt.resolvedUrl("../../icons/brightness-2.svg")
            implicitSize: 22
        }

        IconImage {
            source: Qt.resolvedUrl("../../icons/stat_sys_wifi_signal_3.png")
            implicitSize: 24
        }
    }

    Strip {
        id: hStrip
        color: "#030000"

        spacing: 8
        padding: 6
        orientation: Strip.Horizontal

        anchors {
            left: parent.left
            bottom: parent.bottom
        }
        IconImage {
            source: Qt.resolvedUrl("../../icons/stat_sys_wifi_signal_3.png")
            implicitSize: 24
        }
        IconImage {
            source: Qt.resolvedUrl("../../icons/stat_sys_data_bluetooth.png")
            implicitSize: 24
        }

        IconImage {
            source: Qt.resolvedUrl("../../icons/leaf.svg")
            implicitSize: 20
        }

        IconImage {
            source: Qt.resolvedUrl("../../icons/sun-moon.svg")
            implicitSize: 20
        }
    }

    // HoverHandler {
    //     id: handler

    //     onHoveredChanged: {
    //         if (!hovered)
    //             root.collapse();
    //     }
    // }

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onExited: {
            root.collapse();
        }
    }
}
