pragma Singleton
pragma ComponentBehavior: Bound
import Quickshell
import Quickshell.Io

Singleton {
    id: root
    property real value: 0

    Process {
        running: true
        command: ["light", "-G"]
        stdout: StdioCollector {
            onStreamFinished: {
                root.value = +text;
            }
        }
    }
    Process {
        id: setter
        command: ["light", "-S", root.value]
    }

    function setBrightness(value: real) {
        root.value = Math.max(0, Math.min(100, value));
        setter.running = true;
    }

    IpcHandler {
      target: "brightness"

      function inc(amount: real) {
          root.setBrightness(root.value + amount);
      }
    }

}
