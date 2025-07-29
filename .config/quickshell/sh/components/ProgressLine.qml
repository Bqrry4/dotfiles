import QtQuick
import QtQuick.Shapes

Item {
    id: root
    required property real value
    property int divisions: 0
    property int group: 0
    Rectangle {
        id: filled
        // color: "#FFB259"
        color: "#ff661f"
        // radius: 5
        bottomLeftRadius: 5
        topLeftRadius: 5
        height: parent.height
        width: parent.width * parent.value
    }

    Rectangle {
        id: empty
        // opacity: 0.5
        radius: 1
        color: "#001D3F"
        anchors {
            left: filled.right
        }
        height: parent.height
        width: parent.width - filled.width
    }

    Repeater {
        model: root.divisions - 1

        Rectangle {
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
