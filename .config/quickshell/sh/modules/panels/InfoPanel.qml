import QtQuick
import Quickshell
import Quickshell.Widgets
import qs.components

Item {
    id: root

    width: hStrip.width
    height: vStrip.height

    property color backgroundColor: "black"

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
        color: backgroundColor

        spacing: 8
        padding: 6

        orientation: Strip.Vertical

        anchors {
            right: parent.right
            top: parent.top
        }

        IconImage {
            source: Qt.resolvedUrl("../../icons/cpu.svg")
            implicitSize: 22
        }

        IconImage {
            source: Qt.resolvedUrl("../../icons/cpu-2.svg")
            implicitSize: 22
        }

        IconImage {
            source: Qt.resolvedUrl("../../icons/memory.svg")
            implicitSize: 22
        }

        IconImage {
            source: Qt.resolvedUrl("../../icons/stat_sys_wifi_signal_3.png")
            implicitSize: 24
        }
    }

    Strip {
        id: hStrip
        color: backgroundColor

        spacing: 8
        padding: 6
        orientation: Strip.Horizontal

        anchors {
            right: parent.right
            top: parent.top
        }
        IconImage {
            source: Qt.resolvedUrl("../../icons/cpu.svg")
            implicitSize: 22
        }

        IconImage {
            source: Qt.resolvedUrl("../../icons/cpu-2.svg")
            implicitSize: 22
        }

        IconImage {
            source: Qt.resolvedUrl("../../icons/memory.svg")
            implicitSize: 22
        }
    }

    HoverHandler {
        id: handler

        onHoveredChanged: {
            if (!hovered)
                root.collapse();
        }
    }
}
