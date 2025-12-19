pragma ComponentBehavior: Bound
pragma Singleton

import QtQuick
import Quickshell.Services.Notifications

NotificationServer {
    id: root
    property list<QtObject> notifications: []

    signal newNotification()

    keepOnReload: false
    actionsSupported: true
    actionIconsSupported: true
    bodyHyperlinksSupported: true
    bodyImagesSupported: true
    bodyMarkupSupported: true
    bodySupported: true
    imageSupported: true
    persistenceSupported: true

    onNotification: notification => {
        notification.tracked = true;

        root.notifications.push(notification);
        newNotification();

        console.log(JSON.stringify(notification));
    }
}
