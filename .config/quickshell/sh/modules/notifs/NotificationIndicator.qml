import QtQuick

ShaderEffect {
    anchors.fill: parent
    id: root
    property color color: "#fd2149"
    property real radius: 0.05
    property real borderWidth: 0.01
    property real aalias: 0.02

    property real progress: 0.0

    vertexShader: "./shape.vert.qsb"
    fragmentShader: "./shape.frag.qsb"

    function show() { root.state = "shown" }
    function hide() { root.state = "hidden" }

    states: [
            State {
                name: "shown"
                PropertyChanges { target: root; progress: 1 }
            },
            State {
                name: "hidden"
                PropertyChanges { target: root; progress: 0 }
            }
        ]

        transitions: [
            Transition {
                from: "hidden"; to: "shown"
                SpringAnimation {
                    target: root
                    property: "progress"
                    spring: 3
                    damping: 0.1
                    epsilon: 0.01
                    duration: 400
                    easing.type: Easing.InExpo
                }
            },
            Transition {
                from: "shown"; to: "hidden"
                NumberAnimation {
                    target: root
                    property: "progress"
                    from: 1; to: 0
                    duration: 400
                    easing.type: Easing.InExpo
                }
            }
        ]
}
