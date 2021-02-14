import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import Felgo 3.0

ItemDelegate {
    id: itemDelegate
    hoverEnabled: true

    default property alias children: rowLayout.children
    property alias backgroundColor: backgroundRectangle.color

    QtObject {
        id: d

        readonly property color stdButtonColor: "transparent"
        readonly property color selectedButtonColor: appStyle.lightMediumGray
        readonly property color hoveredButtonColor: appStyle.lightGray
        readonly property int standardSpacing: dp(8)
        readonly property real stdRadius: dp(5)
    }

    state: "standard"
    states: [
        State {
            name: "standard"
            PropertyChanges {
                target: backgroundRectangle
                color: d.stdButtonColor
            }
        },

        State {
            name: "selected"
            PropertyChanges {
                target: backgroundRectangle
                color: d.selectedButtonColor
            }
        }
    ]

    background: Rectangle {
        id: backgroundRectangle
        anchors.fill: parent
        radius: d.stdRadius

        Rectangle {
            anchors.fill: parent
            color: d.hoveredButtonColor
            radius: d.stdRadius
            visible: {
                if (itemDelegate.state === "selected") {
                    return false
                }

                return itemDelegate.hovered
            }
        }
    }

    RowLayout {
        id: rowLayout
        anchors{
            fill: parent
            leftMargin: d.standardSpacing
            rightMargin: d.standardSpacing
        }
        spacing: d.standardSpacing
    }

    MouseArea {
        id: itemDelegateMouseArea
        anchors.fill: parent
        hoverEnabled: true
        acceptedButtons: Qt.NoButton

        onEntered: {
            if (itemDelegate.state === "selected") {
                return
            }

            itemDelegateMouseArea.cursorShape = Qt.PointingHandCursor
        }
        onExited: itemDelegateMouseArea.cursorShape = Qt.ArrowCursor
    }
}
