pragma Singleton
import Quickshell
import QtQml

Singleton {
    id: root

    function get(url: string, callback: var): void {
        const xhr = new XMLHttpRequest();

        xhr.open("GET", url, true);
        xhr.onreadystatechange = () => {
            if (xhr.readyState !== XMLHttpRequest.DONE)
                return;

            if (xhr.status === 200) {
                callback(xhr.responseText);
            } else {
                console.warn(`[REQUEST] Failed GET request to ${url}, status ${xhr.status}`);
            }
        };
        xhr.onerror = () => {
            console.warn(`[REQUEST] Failed GET request to ${url}`);
        };

        xhr.send();
    }
}
