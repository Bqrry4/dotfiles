import QtQuick
import QtQuick.Effects
import Quickshell
import Quickshell.Wayland
import Quickshell.Io
import Quickshell.Services.UPower
import Quickshell.Widgets

import qs.components
import qs.services
import qs.modules.panels
import qs.modules.clock
import qs.modules.notifs
import qs.modules.w_decorations

ShellRoot {
    Variants {
        // Create the panel once on each monitor.
        model: Quickshell.screens

        PanelWindow {
            id: w
            Component.onCompleted: {
                console.log(JSON.stringify(PowerProfiles.profile));
                console.log(JSON.stringify(UPower.displayDevice));
            }
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
                    regions: [panel.region, tweak.region, notif.region]
                }

            }

            WlrLayershell.layer: WlrLayer.Top
            WlrLayershell.exclusionMode: ExclusionMode.Ignore
            WlrLayershell.namespace: "shell"



            property int iconSize: 20

            CornerPanel {
                id: panel
                layer.enabled: true
                backgroundColor: "black"
                anchors {
                    right: parent.right
                    top: parent.top
                }

                vStrip: [
                    Image {
                        width: iconSize
                        height: iconSize
                        source: Qt.resolvedUrl("./icons/cat_sleep.svg")
                        fillMode: Image.Stretch
                    },
                    Rectangle {
                        color: "transparent"
                        width: children[0].width
                        height: children[0].height
                        IconImage {
                            source: Qt.resolvedUrl("./icons/battery.svg")
                            implicitSize: iconSize
                        }
                    },
                    Rectangle {
                        color: "transparent"
                        width: children[0].width
                        height: children[0].height
                        IconImage {
                            source: Qt.resolvedUrl("./icons/mobiledata.svg")
                            implicitSize: iconSize
                        }
                    },
                    Rectangle {
                        color: "transparent"
                        width: children[0].width
                        height: children[0].height
                        IconImage {
                            source: Qt.resolvedUrl("./icons/server-2.svg")
                            implicitSize: iconSize
                        }
                    }
                ]

                hStrip: [
                    Rectangle {
                        color: "transparent"
                        width: children[0].width
                        height: children[0].height
                        IconImage {
                            source: Qt.resolvedUrl("./icons/cpu.svg")
                            implicitSize: iconSize
                            // layer.enabled: true
                            // layer.effect: MultiEffect {
                            //     shadowEnabled: true
                            //     shadowBlur: 1.0
                            //     shadowScale: 1.2
                            //     shadowColor: "white"
                            // }
                        }
                    },
                    Rectangle {
                        color: "transparent"
                        width: children[0].width
                        height: children[0].height
                        IconImage {
                            source: Qt.resolvedUrl("./icons/cpu-2.svg")
                            implicitSize: iconSize
                        }
                    },
                    Rectangle {
                        color: "transparent"
                        width: children[0].width
                        height: children[0].height
                        IconImage {
                            source: Qt.resolvedUrl("./icons/memory.svg")
                            implicitSize: iconSize
                        }
                    },
                    // Rectangle {
                    //     width: iconSize
                    //     height: iconSize
                    //     color: "black"
                    // },
                    Image {
                        width: iconSize
                        height: iconSize
                        source: Qt.resolvedUrl("./icons/cat_sleep.png")
                        fillMode: Image.Stretch
                    }
                ]
            }
            ///
            CornerPanel {
                id: tweak

                alignment: Qt.AlignBottom | Qt.AlignLeft

                backgroundColor: "black"
                anchors {
                    left: parent.left
                    bottom: parent.bottom
                }

                vStrip: [
                    IconImage {
                        source: Qt.resolvedUrl("./icons/stat_sys_wifi_signal_3.png")
                        implicitSize: iconSize
                    },
                    IconImage {
                        source: Qt.resolvedUrl("./icons/stat_sys_data_bluetooth.png")
                        implicitSize: iconSize
                    },
                    IconImage {
                        source: Qt.resolvedUrl("./icons/brightness-2.svg")
                        implicitSize: iconSize
                    },
                    IconImage {
                        source: Qt.resolvedUrl("./icons/volume.svg")
                        implicitSize: iconSize
                    },
                    IconImage {
                        source: Qt.resolvedUrl("../icons/stat_sys_wifi_signal_3.png")
                        implicitSize: iconSize
                    }
                ]

                hStrip: [
                    Rectangle {
                        width: iconSize
                        height: iconSize
                        color: "black"
                    },
                    IconImage {
                        source: Qt.resolvedUrl("./icons/mic.svg")
                        implicitSize: iconSize
                    },
                    IconImage {
                        source: Qt.resolvedUrl("./icons/leaf.svg")
                        implicitSize: iconSize
                    },
                    IconImage {
                        source: Qt.resolvedUrl("./icons/sun-moon.svg")
                        implicitSize: iconSize
                    },
                    IconImage {
                        source: Qt.resolvedUrl("./icons/coffee.svg")
                        implicitSize: iconSize
                    }
                ]
            }

            Notifications {
                id: notif
                anchors {
                    right: parent.right
                    bottom: parent.bottom
                }
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
            // visible: false
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

            WDecorations {
                anchors.fill: parent
            }
        }
    }
}
