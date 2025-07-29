import QtQuick
import Quickshell
import Quickshell.Wayland
import Quickshell.Io
import Quickshell.Services.UPower
import Quickshell.Widgets

import qs.components
import qs.services
import qs.modules.panels
import qs.modules.clock

ShellRoot {
    Variants {
        // Create the panel once on each monitor.
        model: Quickshell.screens

        PanelWindow {
            id: w
            // Component.onCompleted: {
            //     console.log(JSON.stringify(PowerProfiles.profile));
            // }
            property var modelData
            screen: modelData

            anchors {
                right: true
                left: true
                top: true
                bottom: true
            }

            color: "transparent"

            mask: Region {
                // Region {
                //     regions: [tweak.region, info.region]
                //     intersection: Intersection.Combine
                // }
                Region {
                    regions: [panel.region]
                }
            }

            WlrLayershell.layer: WlrLayer.Top
            WlrLayershell.exclusionMode: ExclusionMode.Ignore
            WlrLayershell.namespace: "shell"

            CornerPanel {
                id: panel
                layer.enabled: true
                backgroundColor: "black"
                anchors {
                    right: parent.right
                    top: parent.top
                }

                vStrip: [
                    IconImage {
                        source: Qt.resolvedUrl("./icons/cpu.svg")
                        implicitSize: 22
                    },
                    IconImage {
                        source: Qt.resolvedUrl("./icons/cpu-2.svg")
                        implicitSize: 22
                    },
                    IconImage {
                        source: Qt.resolvedUrl("./icons/memory.svg")
                        implicitSize: 22
                    },
                    IconImage {
                        source: Qt.resolvedUrl("./icons/stat_sys_wifi_signal_3.png")
                        implicitSize: 24
                    }
                ]

                hStrip: [
                    IconImage {
                        source: Qt.resolvedUrl("./icons/cpu.svg")
                        implicitSize: 22
                    },
                    IconImage {
                        source: Qt.resolvedUrl("./icons/cpu-2.svg")
                        implicitSize: 22
                    },
                    IconImage {
                        source: Qt.resolvedUrl("./icons/memory.svg")
                        implicitSize: 22
                    }
                ]
            }
            // StyledSlider {}

            // IpcHandler {
            //     target: "tweak"
            //     function expand() {
            //         tweak.expand();
            //     }
            // }
        }
    }
    Variants {
        model: Quickshell.screens
        PanelWindow {
            id: window

            property var modelData
            screen: modelData

            anchors {
                bottom: true
                right: true
                left: true
                top: true
            }
            margins {
                left: 8
                right: 8
            }
            color: "transparent"
            WlrLayershell.layer: WlrLayer.Bottom
            WlrLayershell.exclusionMode: ExclusionMode.Ignore

            Clock {
                anchors {
                    top: parent.top
                    left: parent.left
                }
            }

            Rectangle {
                anchors {
                    top: parent.top
                    right: parent.right
                }
                radius: 8
                color: "#fdfbfc"
                height: 5
                width: 405
            }

            Rectangle {
                anchors {
                    bottom: parent.bottom
                    left: parent.left
                }
                radius: 8
                color: "#fdfbfc"
                height: 5
                width: 405
            }
        }
    }
}
