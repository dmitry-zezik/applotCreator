import QtQuick 2.12
import QtQuick.Controls 2.12
import Felgo 3.0

import "../Pages"

Rectangle {
    id: navView
    color: appStyle.mainBackground

    property int currentIndex: 0

    UIXPage {
        id: uixPage
        anchors.fill: parent
        visible: currentIndex === 0
    }

    Rectangle {
        color: "blue"
        anchors.fill: parent
        visible: currentIndex === 1
    }

    Rectangle {
        color: "red"
        anchors.fill: parent
        visible: currentIndex === 2
    }

    Rectangle {
        color: "orange"
        anchors.fill: parent
        visible: currentIndex === 3
    }

    Rectangle {
        color: "yellow"
        anchors.fill: parent
        visible: currentIndex === 4
    }
}
