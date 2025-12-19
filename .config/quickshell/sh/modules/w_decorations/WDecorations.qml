import QtQuick
import qs
import qs.components
import qs.services

/*
    State: default
        Rectangle or a full progress bar
    State: changing volume/brightness
        Progress bar that updates
    State: Charging, same rectangle but animated?
    State: special event indicator?
        Battery low
*/

Item {
    id: root

    property int decorationH: 5
    property int decorationW: 400

    state: "idle"

    Rectangle {
        id: upper
        anchors {
            top: parent.top
            right: parent.right
        }
        radius: 8
        color: Settings.c2

        height: root.decorationH
        width: root.decorationW
    }

    Rectangle {
        id: lower
        anchors {
            bottom: parent.bottom
            left: parent.left
        }
        radius: 8
        color: Settings.c2

        height: root.decorationH
        width: root.decorationW
    }

    ProgressLineHide {
        id: brightness
        value: Brightness.value / 100
        noDelay: true
        anchors {
            top: parent.top
            right: parent.right
        }
        hcolor: "transparent"
        bcolor: Settings.c3

        height: root.decorationH
        width: root.decorationW
    }

    ProgressLineHide {
        id: volume
        value: Audio.volume
        noDelay: true
        anchors {
            bottom: parent.bottom
            left: parent.left
        }
        hcolor: Settings.c3
        bcolor: "transparent"

        height: root.decorationH
        width: root.decorationW
    }


    states: [
        State {
            name: "idle"
            // PropertyChanges {
            //     target: volume
            //     opacity: 0
            // }
            // PropertyChanges {
            //     target: brightness
            //     opacity: 0
            // }
            // PropertyChanges {
            //     target: chargingAnim
            //     running: false
            // }
        },

        State {
            name: "charging"
            PropertyChanges {
                target: progressBar
                visible: false
            }
            PropertyChanges {
                target: chargingOverlay
                opacity: 0.3
            }
            PropertyChanges {
                target: chargingAnim
                running: true
            }
        }
    ]

}
