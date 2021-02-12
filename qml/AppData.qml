import QtQuick 2.12
import Felgo 3.0

Item {
    id: appData

    property alias devicesModel: devicesModel
    property alias device: device

    ListModel {
        id: devicesModel
        ListElement {
            value: "iPhone X"
            source: "../resources/devices/iphone-x.png"
        }
    }

    QtObject {
        id: device

        property int currentIndex: -1
        property bool safeZone: false
    }

}
