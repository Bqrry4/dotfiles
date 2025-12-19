import QtQuick

ProgressLine {
    id: root
    opacity: 0

    onValueChanged: {
        root.opacity = 1;
        hideTimer.restart();
    }

    Timer {
        id: hideTimer
        interval: 1000
        onTriggered: root.opacity = 0;
    }

    Behavior on opacity {
        NumberAnimation { duration: 1200; easing.type: Easing.InOutQuad }
    }
}
