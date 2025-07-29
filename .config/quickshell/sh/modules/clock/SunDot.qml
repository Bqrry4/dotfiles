import QtQuick

Rectangle {
    required property date value

    width: radius
    height: radius
    x: parent.width * (value.getHours() + value.getMinutes() / 60) / 24 - width / 2

    Behavior on x {
        PropertyAnimation {
            easing.type: Easing.InOutElastic
            duration: 3000
        }
    }
}
