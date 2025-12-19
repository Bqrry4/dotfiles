pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Shapes

Item {
    id: root
    required property real value
    property int divisions: 0
    property int group: 0
    property color hcolor
    property color bcolor
    property bool noDelay

    Rectangle {
        id: filled
        color: root.hcolor
        bottomLeftRadius: 5
        topLeftRadius: 5
        height: parent.height
        width: parent.width * parent.value

        Behavior on width {
            PropertyAnimation {
                easing.type: Easing.InOutQuad
                duration: (root.noDelay)? 0: 500
            }
        }
    }

    Rectangle {
        id: empty
        radius: 1
        color: root.bcolor
        anchors {
            left: filled.right
        }
        height: parent.height
        width: parent.width - filled.width

        PropertyAnimation {
            property: "width"
            easing.type: Easing.InOutElastic
            duration: (root.noDelay)? 0: 3000
        }
    }

    Repeater {
        model: root.divisions - 1

        Rectangle {
            required property int index

            width: ((index + 1) % root.group) ? 1 : 3
            height: root.height
            color: "black"
            x: (index + 1) * (root.width / root.divisions) - (((index + 1) % root.group) ? 0 : 1)
        }

        // Shape {
        //     preferredRendererType: Shape.CurveRenderer
        //     antialiasing: true
        //     x: (index + 1) * (root.width / root.divisions)
        //     ShapePath {
        //         fillColor: "black"
        //         strokeColor: "black"
        //         startX: 0
        //         startY: root.height / 2

        //         PathArc {
        //             x: -root.height / 4
        //             y: ((index + 1) % root.group) ? root.height : 0
        //             radiusX: 5
        //             radiusY: 5
        //         }
        //         PathLine {
        //             x: root.height / 4
        //             y: root.height
        //         }
        //         PathArc {
        //             x: 0
        //             y: root.height / 2
        //             radiusX: 5
        //             radiusY: 5
        //         }
        //     }
        // }
    }
}
