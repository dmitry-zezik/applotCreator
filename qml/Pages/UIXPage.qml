import QtQuick 2.12
import QtQuick.Controls 2.13
import Felgo 3.0

Item {

    property alias devicePage: devicePage
    property alias projectPage: projectPage

    property var projectPagesModel: devicePage.viewerPage.appPages
    property var projectContentModel: devicePage.viewerPage.appContent

    QtObject {
        id: d

        readonly property real minWidth: splitView.width * 0.3
    }

    Rectangle { // background for navigationView handle
        width: parent.width
        height: dp(42)
        color: appStyle.mainTitleBackground
    }

    SplitView {
        id: splitView
        anchors.fill: parent
        orientation: Qt.Horizontal

        handle: Rectangle {
            implicitWidth: dp(2)
            implicitHeight: dp(2)
            color: SplitHandle.pressed ? appStyle.blue : "transparent"
        }

        ProjectComponentsPage {
            id: projectPage
            SplitView.minimumWidth: d.minWidth
            SplitView.fillWidth: true
            SplitView.fillHeight: true
        }

        DevicePage {
            id: devicePage
            SplitView.minimumWidth: d.minWidth
            SplitView.preferredWidth: splitView.width * 0.3
            SplitView.fillHeight: true
        }
    }

}
