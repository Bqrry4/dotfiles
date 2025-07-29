import QtQuick
import Quickshell
import Quickshell.Widgets

Item {
    id: root

    property int alignment: Qt.AlignTop | Qt.AlignRight

    required property color backgroundColor
    property int spacing: 8
    property int padding: 8

    property alias hStrip: hStrip.content
    property alias vStrip: vStrip.content

    width: hStrip.width + 10
    height: vStrip.height + 10

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
        Region {
            item: hcorner
            intersection: Intersection.Combine
        }
    }

    Strip {
        id: vStrip
        color: root.backgroundColor

        spacing: root.spacing
        padding: root.padding

        orientation: Strip.Vertical

        anchors {
            left: (root.alignment & Qt.AlignLeft) ? parent.left : undefined
            right: (root.alignment & Qt.AlignRight) ? parent.right : undefined
            top: (root.alignment & Qt.AlignTop) ? parent.top : undefined
            bottom: (root.alignment & Qt.AlignBottom) ? parent.bottom : undefined
        }
    }

    Strip {
        id: hStrip
        color: root.backgroundColor

        spacing: root.spacing
        padding: root.padding

        orientation: Strip.Horizontal

        anchors {
            left: (root.alignment & Qt.AlignLeft) ? parent.left : undefined
            right: (root.alignment & Qt.AlignRight) ? parent.right : undefined
            top: (root.alignment & Qt.AlignTop) ? parent.top : undefined
            bottom: (root.alignment & Qt.AlignBottom) ? parent.bottom : undefined
        }
    }

    HoverHandler {
        id: handler

        onHoveredChanged: {
            if (!hovered)
                root.collapse();
        }
    }

    HotCorner {
        id: hcorner
        anchors {
            left: (root.alignment & Qt.AlignLeft) ? parent.left : undefined
            right: (root.alignment & Qt.AlignRight) ? parent.right : undefined
            top: (root.alignment & Qt.AlignTop) ? parent.top : undefined
            bottom: (root.alignment & Qt.AlignBottom) ? parent.bottom : undefined
        }

        onHovered: {
            root.expand();
        }
    }
}
