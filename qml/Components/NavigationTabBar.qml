import QtQuick 2.0
import Felgo 3.0
import "../Components"


Rectangle {
    id: navigationTabBar
    width: dp(60)
    height: parent.height
    color: "gray"

    property alias currentIndex: navigationListView.currentIndex

    QtObject {
        id: d

        readonly property real sqButtonHeight: dp(42)
    }

    ListModel {
        id: navigationListModel

        ListElement {
            name: "UIX"
        }

        ListElement {
            name: "CODE"
        }

        ListElement {
            name: "MEDIA"
        }

        ListElement {
            name: "TEXT"
        }

        ListElement {
            name: "PUBLISH"
        }
    }

    ListView {
        id: navigationListView
        anchors.fill: parent
        interactive: false
        model: navigationListModel
        delegate: navigationDelegate
    }

    Component {
        id: navigationDelegate

        SquareButton {
            width: parent.width
            height: d.sqButtonHeight
            text: name
            state: navigationListView.currentIndex === index ? "selected" : "standard"
            onStateChanged: console.log("STATE:", state, index)
            onClicked: {
                navigationListView.currentIndex = index
            }
        }
    }
}
