import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import QtWebEngine 1.8
import QtLocation 5.12
import QtPositioning 5.12

Window {
    visible: true
    width: 800
    height: 600
    title: qsTr("MapTiler QML demo")

    property string hostingKey: "<your-hosting-key>"

    TabBar {
        id: bar
        width: parent.width
        TabButton {
            text: qsTr("Vector style - MapboxGL")
        }
        TabButton {
            text: qsTr("Raster style - MapboxGL")
        }
        TabButton {
            text: qsTr("Web Browser")
        }
    }

    StackLayout {
        width: parent.width
        anchors.top: bar.bottom
        anchors.bottom: parent.bottom

        currentIndex: bar.currentIndex
        Item {
            id: vectorTab

            Plugin {
                id: mapPluginVector
                name: "mapboxgl"

                PluginParameter {
                    name: "mapboxgl.mapping.additional_style_urls"
                    value: "https://api.maptiler.com/maps/streets/style.json?key=" + hostingKey
                }
            }

            Map {
                id: mapVector

                anchors.fill: parent
                plugin: mapPluginVector
                zoomLevel: 14
            }
        }
        Item {
            id: rasterTab

            Plugin {
                id: mapPluginRaster
                name: "mapboxgl"

                PluginParameter {
                    name: "mapboxgl.mapping.additional_style_urls"
                    value: "https://api.maptiler.com/maps/hybrid/style.json?key=" + hostingKey
                }
            }

            Map {
                id: mapRaster

                anchors.fill: parent
                plugin: mapPluginRaster
                zoomLevel: 14
            }
        }
        Item {
            id: webBrowserTab

            WebEngineView {
                anchors.fill: parent
                url: "https://api.maptiler.com/maps/streets/?key=" + hostingKey
                     + "#1.22/-0.00000/0.00000"
            }
        }
    }
}
