pragma Singleton

import QtQuick
import Quickshell
import QtPositioning
import qs
import qs.services

//TODO: request after midnight and after waking up
Singleton {
    id: root

    property var sun_position: ({
            sunrise: new Date(),
            sunset: new Date(),
            solar_noon: new Date()
        })

    Component.onCompleted: {
        Request.get(`https://api.sunrise-sunset.org/json?lat=${location.lat}&lng=${location.lon}&formatted=0&tzid=${Settings.timezone}`, body => {
            let parsed_body = JSON.parse(body).results;
            sun_position = {
                sunrise: new Date(parsed_body.sunrise),
                sunset: new Date(parsed_body.sunset),
                solar_noon: new Date(parsed_body.solar_noon)
            };
        });
    }

    property var location: undefined

    PositionSource {
        updateInterval: 60000
        active: true

        onPositionChanged: {
            if (!position.latitudeValid || !position.longitudeValid)
                return;

            root.location = {
                lat: position.coordinate.latitude,
                lon: position.coordinate.longitude
            };
        }
    }
}
