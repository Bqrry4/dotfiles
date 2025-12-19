/* A StyledFlow.. */

pragma ComponentBehavior: Bound

import QtQuick

Rectangle {
    id: root
    clip: true

    enum Orientation {
        Vertical,
        Horizontal
    }

    required property int orientation
    property int padding: 0

    function expand() {
        this.state = "expanded";
    }

    function collapse() {
        this.state = "collapsed";
    }

    state: "collapsed"
    states: [
        State {
            name: "collapsed"
            PropertyChanges {
                root.width: (root.orientation == Strip.Horizontal) ? 0 : layout.width + padding
                root.height: (root.orientation == Strip.Vertical) ? 0 : layout.height + padding
                // root.visible: false
            }
        },
        State {
            name: "expanded"
            PropertyChanges {
                root.width: layout.width + padding
                root.height: layout.height + padding
                // root.visible: true
            }
        }
    ]

    transitions: [
        Transition {
            from: "collapsed"
            to: "expanded"
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

    default property alias content: layout.data
    property alias direction: layout.layoutDirection
    property alias spacing: layout.spacing
    Flow {
        id: layout
        flow: (root.orientation == Strip.Horizontal) ? Flow.LeftToRight : Flow.TopToBottom
        // transform: Scale {
        //     yScale: -1 // flips vertically
        //     origin.y: layout.height / 2
        // }
        anchors.centerIn: parent
    }
}
