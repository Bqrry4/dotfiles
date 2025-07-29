import QtQuick

Item {
    id: root
    signal hovered
    width: 1
    height: 1

    HoverHandler {
        onHoveredChanged: {
            if (hovered) {
                root.hovered();
            }
        }
    }
}
