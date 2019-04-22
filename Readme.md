MapTiler QML Demo
=================
This simple application demonstrates using MapTiler Cloud tile hosting inside Qt.

Application is splitted into three tabs demonstrating three ways how to use MapTiler.

First we need to define our hostingKey property
```
property string hostingKey: "<your-map-hosting-key-belongs-here>"
```

--------------------------------------------

## Using Qt Location Mapbox GL vector styles

To use vector styles we will use Mapbox GL Qt Location plugion. Add Map element and insert mapboxgl plugin. Now we have to set maptiler styles, pass the appropriate value to mapboxgl.mapping.additional_style_urls plugin parameter.

```
Plugin {
    id: mapPluginVector
    name: "mapboxgl"

    PluginParameter {
        name: "mapboxgl.mapping.additional_style_urls"
        value: "https://api.maptiler.com/maps/streets/style.json?key="
               + hostingKey
    }
}

Map {
    id: mapVector

    anchors.fill: parent
    plugin: mapPluginVector
    zoomLevel: 14
}
```
-------------------------------------------
## Using Qt Location Mapbox GL raster tiles

To achieve rendering raster tiles we have to set maptiler styles and define new raster source and raster layer. Pass the appropriate url to source url property.

```
Plugin {
    id: mapPluginRaster
    name: "mapboxgl"

    PluginParameter {
        name: "mapboxgl.mapping.additional_style_urls"
        value: "https://api.maptiler.com/maps/hybrid/style.json?key="
               + hostingKey
    }
}

Map {
    id: mapRaster

    anchors.fill: parent
    plugin: mapPluginRaster
    zoomLevel: 14

}
```

--------------------------------------------

## Embedding web map browser using WebEngine

We can also use embedded browser view. By using WebEngineView we use Chromium, setup is as simple as passing correct url to broser.
If you are unable to use WebEngine, simply swap WebEngine with WebView to use native platform browser.

```
WebEngineView {
    anchors.fill: parent
    url: "https://api.maptiler.com/maps/streets/?key="
                     + hostingKey + "#1.22/-0.00000/0.00000"
}
```
