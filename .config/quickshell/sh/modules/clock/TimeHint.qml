import QtQuick
import Quickshell
import qs.services

PopupWindow {
    id: root

    implicitWidth: hint.implicitWidth
    implicitHeight: hint.implicitHeight
    color: "transparent"

    Text {
        id: hint
        text: TimeService.format("hh:mm")
        color: "white"
        font.pixelSize: 12
    }

    Behavior on anchor.rect {
        ParallelAnimation {
            id: hintAnimation
            running: true
            NumberAnimation {
                property: "x"
                to: 500
                duration: 1000
            }
            NumberAnimation {
                property: "y"
                to: 500
                duration: 1000
            }
        }
    }
}
