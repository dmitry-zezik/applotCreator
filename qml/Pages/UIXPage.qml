import QtQuick 2.12
import QtQuick.Controls 2.13
import Felgo 3.0

Item {

    Rectangle { // background for navigationView handle
        width: parent.width
        height: dp(42)
        color: appStyle.mainTitleBackground
    }

    SplitView {
        id: splitView
        anchors.fill: parent
        orientation: Qt.Horizontal

        QtObject {
            id: d

            readonly property real minWidth: splitView.width * 0.2
        }

        handle: Rectangle {
            implicitWidth: dp(2)
            implicitHeight: dp(2)
            color: SplitHandle.pressed ? appStyle.blue : "transparent"
        }

        ProjectComponentsPage {
            SplitView.minimumWidth: d.minWidth
            SplitView.fillWidth: true
            SplitView.fillHeight: true
        }

        DevicePage {
            SplitView.minimumWidth: d.minWidth
            SplitView.preferredWidth: splitView.width * 0.3
            SplitView.fillHeight: true
        }
    }

}
