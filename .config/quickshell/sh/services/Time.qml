pragma Singleton

import Quickshell

Singleton {
    readonly property date date: clock.date
    readonly property int hours: clock.hours
    readonly property int minutes: clock.minutes

    function format(fmt: string): string {
        return Qt.formatDateTime(this.date, fmt);
    }

    SystemClock {
        id: clock
        precision: SystemClock.Minutes
    }
}
