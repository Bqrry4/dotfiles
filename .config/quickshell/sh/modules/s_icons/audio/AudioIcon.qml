import QtQuick
import Quickshell.Widgets
import qs.services

Rectangle{
    width: 50
    height: 50
    Text {
        text: Audio.volume
        font.pointSize: 5
        color: "black"
        anchors.fill: parent
    }
}
