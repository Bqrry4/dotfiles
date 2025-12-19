import QtQuick
import Quickshell
import Quickshell.Widgets
import QtQuick.Shapes
import QtQuick.Effects

Item {
    id: root

    property int alignment: Qt.AlignTop | Qt.AlignRight

    required property color backgroundColor
    property int spacing: 2
    property int padding: 4

    property alias hStrip: hStrip.content
    property alias vStrip: vStrip.content

    width: hStrip.width + 200
    height: vStrip.height + 200

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

    // Rectangle {
    //     id: a
    //     width: 20
    //     height: 15
    //     color: "black"
    //     anchors.right: hStrip.left
    // }

    // Rectangle {
    //     width: 20
    //     height: 6
    //     color: "black"
    //     anchors.right: a.left
    // }

    Shape {
        visible: false
        id: shape
        preferredRendererType: Shape.CurveRenderer
        antialiasing: true
        //
        // v
        anchors.right: hStrip.left
        height: hStrip.height
        width: 100
        ShapePath {
            fillColor: "black"
            strokeColor: "black"
            startX: shape.width
            startY: shape.height - 1

            PathCubic {
                x: 0
                y: -1
                // control1X: shape.width
                // control1Y: 0
                // control2X: 0
                // control2Y: shape.height
                control2X: shape.width
                control2Y: 0
                control1X: shape.width / 1.5
                control1Y: shape.height
            }
            PathLine {
                x: shape.width
                y: 0
            }
        }

        Rectangle {
            id: dot
            width: 3
            height: 3
            radius: 3
            anchors {
                verticalCenter: parent.verticalCenter
                right: parent.right
                rightMargin: 8
            }
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
