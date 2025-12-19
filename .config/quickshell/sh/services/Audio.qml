pragma ComponentBehavior: Bound
pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Services.Pipewire
import Quickshell.Io

Singleton {
    id: root

    // signal sinkVolumeChanged(volume: real);

    property PwNode sink: Pipewire.defaultAudioSink
    property PwNode source: Pipewire.defaultAudioSource

    readonly property bool muted: sink?.audio?.muted ?? false
    readonly property real volume: sink?.audio?.volume ?? 0


    PwObjectTracker {
        objects: [sink, source]
    }

    PwNodeLinkTracker {
        id: track
        node: sink
    }

    function setVolume(volume: real) {
        if (sink?.ready && sink?.audio) {
            sink.audio.volume = Math.max(0, Math.min(1, volume));
        }
    }

    function incSink(amount: real) {
        setVolume(root.volume + amount);
    }

    IpcHandler {
      target: "sink"

      function inc(amount: real) {
          root.setVolume(root.volume + amount);
      }
    }

}
