import QtQuick
import QtQuick.Controls

//! Bloom effect?
// Change it to a circle handle, and animations can be added
Slider {
    id: root
    from: 0
    to: 1

    implicitWidth: 200
    implicitHeight: 3

    property alias handleWidth: handle.width
    property alias handleHeight: handle.height
    property int gap: 6

    handleWidth: 2
    handleHeight: 20

    background: Item {
        anchors.verticalCenter: root.verticalCenter
        width: root.availableWidth
        height: root.availableHeight

        Rectangle {
            anchors.left: parent.left

            width: Math.max(parent.width * root.visualPosition - gap, 0)
            height: parent.height

            radius: 3
            topRightRadius: 1
            bottomRightRadius: 1
            color: "#3e66e0"
        }

        Rectangle {
            anchors.right: parent.right

            width: Math.max(parent.width * (1 - root.visualPosition) - gap, 0)
            height: parent.height

            radius: 3
            topLeftRadius: 1
            bottomLeftRadius: 1
            color: "#fd2149"
        }
    }

    handle: Rectangle {
        id: handle
        anchors.verticalCenter: root.verticalCenter

        radius: 3
        color: "#ff661f"
        // x: root.handleMargins + (root.visualPosition * root.effectiveDraggingWidth) - (root.handleWidth / 2)
        x: root.leftPadding + root.visualPosition * root.availableWidth - this.width / 2
        // x: root.handleMargins + (root.visualPosition * root.effectiveDraggingWidth) - (root.handleWidth / 2)
    }

    onValueChanged: {
        console.log(value);
    }
}
