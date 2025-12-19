import QtQuick
import Quickshell

Background {
    id: root

    function expand() {
        this.state = "expanded";
    }

    function collapse() {
        this.state = "collapsed";

    }
    anchors.right: parent.right
    anchors.bottom: parent.bottom

    property alias model: listView.model
    ListView {
        id: listView
        anchors {
            centerIn: parent
            fill: parent

        }
        anchors.right: parent.right
        anchors.top: parent.top
        // anchors.fill: parent

        spacing: 5
        clip: true

        delegate: NotificationCard {
            implicitWidth: listView.width
        }

    }

    property alias layout: listView

    state: "collapsed"
    states: [
        State {
            name: "collapsed"
            PropertyChanges {
                root.width: 0
                root.height: 0
            }
        },
        State {
            name: "expanded"
            PropertyChanges {
                root.width: 400
                root.height: 300
            }
        }
    ]

    transitions: [
        Transition {
            from: "collapsed"
            to: "expanded"
            NumberAnimation {
                properties: "width, height"
                duration: 300
                easing.type: Easing.InOutQuad
            }
        },
        Transition {
            from: "expanded"
            to: "collapsed"
            NumberAnimation {
                properties: "width, height"
                duration: 300
                easing.type: Easing.InOutQuad
            }
        }
    ]

}
