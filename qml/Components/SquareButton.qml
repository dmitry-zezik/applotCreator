import QtQuick 2.12
import QtQuick.Controls 2.12
import Felgo 3.0

Button {
    id: squareButton
    font.family: "Helvetica"
    font.bold: true
    antialiasing: true
    hoverEnabled: true

    QtObject {
        id: d

        readonly property color stdButtonColor: "transparent"
        readonly property color selectedButtonColor: "black"
        readonly property color hoveredButtonColor: "light gray"
        readonly property color verticalLineColor: "light gray"
    }

    state: "standard"
    states: [
        State {
            name: "standard"
            PropertyChanges {
                target: backgroundRectangle
                color: d.stdButtonColor
            }

            PropertyChanges {
                target: backgroundVerticalLine
                color: "transparent"
            }
        },

        State {
            name: "selected"
            PropertyChanges {
                target: backgroundRectangle
                color: d.selectedButtonColor
            }

            PropertyChanges {
                target: backgroundVerticalLine
                color: d.verticalLineColor
            }
        }
    ]

    contentItem: Item {
        Text {
            anchors.centerIn: parent
            text: squareButton.text
            font: squareButton.font
            color: 'white'
        }
    }

    background: Rectangle {
        id: backgroundRectangle
        anchors.fill: parent

        Rectangle {
            anchors.fill: parent
            color: d.hoveredButtonColor
            visible: {
                if (squareButton.state === "selected") {
                    return false
                }

                return squareButton.hovered
            }
        }

        Rectangle {
            id: backgroundVerticalLine
            width: dp(2)
            height: parent.height
        }
    }

    MouseArea {
        id: squareButtonMouseArea
        anchors.fill: parent
        hoverEnabled: true
        acceptedButtons: Qt.NoButton

        onEntered: {
            if (squareButton.state === "selected") {
                return
            }

            squareButtonMouseArea.cursorShape = Qt.PointingHandCursor
        }
        onExited: squareButtonMouseArea.cursorShape = Qt.ArrowCursor
    }
}
