import QtQuick
import Quickshell
import Quickshell.Wayland

ShellRoot {
    id: root
    property string path: "/home/bqrry/Downloads/wallhaven-nm35e1.jpg"
    Variants {
        model: Quickshell.screens

        PanelWindow {
            required property ShellScreen modelData
            screen: modelData

            WlrLayershell.exclusionMode: ExclusionMode.Ignore
            WlrLayershell.layer: WlrLayer.Background
            WlrLayershell.namespace: "backdrop"
            anchors {
                top: true
                bottom: true
                left: true
                right: true
            }

            color: "transparent"

            Wallpaper {
                anchors.fill: parent
                mediaPath: root.path
            }
        }
    }

    Variants {
        model: Quickshell.screens

        PanelWindow {
            required property ShellScreen modelData
            screen: modelData

            WlrLayershell.exclusionMode: ExclusionMode.Ignore
            WlrLayershell.layer: WlrLayer.Background
            WlrLayershell.namespace: "wallpaper"

            anchors {
                top: true
                bottom: true
                left: true
                right: true
            }

            color: "transparent"

            Wallpaper {
                anchors.fill: parent
                mediaPath: root.path
            }
        }
    }
}
