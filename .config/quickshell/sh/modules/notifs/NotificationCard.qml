import QtQuick
import Quickshell

Flickable {
    id: delegateFlick

    required property QtObject modelData
    implicitHeight: contentLayout.implicitHeight

    boundsBehavior: Flickable.DragAndOvershootBounds
    flickableDirection: Flickable.HorizontalFlick

    Rectangle {
        id: card
        anchors.fill: parent
        color: "#363636"
        radius: 5

        Row{
            anchors.fill: parent
            spacing: 5

            Column {
                id: ca
                anchors.margins: 16
                spacing: 5
                Image {
                    width: 25
                    height: 25
                    source: Qt.resolvedUrl(delegateFlick.modelData.appIcon)
                    fillMode: Image.PreserveAspectCrop
                    cache: false
                    asynchronous: true
                }

                Image {
                    width: 25
                    height: 25
                    source: Qt.resolvedUrl(delegateFlick.modelData.image)
                    fillMode: Image.PreserveAspectCrop
                    cache: false
                    asynchronous: true
                }
            }

            Column {
                id: contentLayout
                width: parent.width

                anchors.margins: 16
                spacing: 2

                // Text {
                //     id: summary
                //     anchors.top: parent.top

                //     text: delegateFlick.modelData.summary
                //     font.pixelSize: 12
                //     font.weight: Font.DemiBold
                //     color: "#EEEEEE"
                //     elide: Text.ElideRight
                // }

                // Text {
                //     id: separator
                //     anchors.top: parent.top
                //     anchors.left: summary.right

                //     text: "•"
                //     font.pixelSize: 12
                //     font.weight: Font.DemiBold
                //     color: "#EEEEEE"
                //     elide: Text.ElideRight
                // }

                // Text {
                //     id: time

                //     anchors.top: parent.top
                //     anchors.left: separator.right

                //     horizontalAlignment: Text.AlignLeft
                //     text: "now"
                //     font.pixelSize: 12

                // }

                Text {
                    id: body
                    width: parent.width

                    text: delegateFlick.modelData.body
                    font.pixelSize: 12
                    font.weight: Font.Normal
                    color: "#EEEEEE"
                    elide: Text.ElideRight
                }
                Text {
                    id: appName

                    text: delegateFlick.modelData.appName
                    font.pixelSize: 8
                    font.weight: Font.Medium
                    color: "#AAAAAA"
                    elide: Text.ElideRight
                }

            }
        }

    }
}
