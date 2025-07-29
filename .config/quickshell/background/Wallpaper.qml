import QtMultimedia 6.8
import QtQuick 6.8

Rectangle {
    id: background

    required property string mediaPath

    Component {
        id: static

        Image {
            id: image

            source: mediaPath
            anchors.fill: parent
            clip: true
            focus: true
            smooth: true
        }
    }

    Component {
        id: live

        Rectangle {
            color: "black"

            MediaPlayer {
                id: mediaplayer

                source: mediaPath
                videoOutput: videoOutput
                autoPlay: true
                loops: MediaPlayer.Infinite
            }

            VideoOutput {
                id: videoOutput

                fillMode: VideoOutput.PreserveAspectCrop
                anchors.fill: parent
            }
        }
    }

    //Checks extension for media type
    function getByExtension(filename) {
        var imgs = /\.(jpg|jpeg|png)$/i;
        var vids = /\.(mp4|avi|mov)$/i;

        if (imgs.test(filename))
            return static;
        if (vids.test(filename))
            return live;

        console.log("Could not load by checking the extension in filename.");
        return null;
    }

    Loader {
        id: loader

        anchors.fill: parent
        active: true
        sourceComponent: getByExtension(mediaPath)
    }
}
