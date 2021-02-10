import QtQuick 2.12
import Felgo 3.0
import "./Components"

Item {
    id: mainApp

    anchors.fill: parent

    NavigationSwipeView {
        id: navigationSwipeView

        anchors {
            top: parent.top
            left: navigationTabBar.right
            bottom: parent.bottom
            right: parent.right
        }

        currentIndex: navigationTabBar.currentIndex
    }

    NavigationTabBar {
        id: navigationTabBar
    }
}
