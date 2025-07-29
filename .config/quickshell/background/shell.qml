import QtQuick
import Quickshell
import Quickshell.Wayland

ShellRoot {
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
                mediaPath: "/home/bqrry/Desktop/mystery_cat.mp4"
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
                mediaPath: "/home/bqrry/Desktop/mystery_cat.mp4"
            }
        }
    }
}
