import QtQuick 2.12
import QtQuick.Controls 2.13 as C2
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.12
import Felgo 3.0

import "../Components"

C2.Page {
    id: projectPage

    QtObject {
        id: d

        readonly property int smallSpacing: dp(4)
        readonly property int standardSpacing: dp(8)
        readonly property int bigSpacing: dp(12)
    }

    background: Rectangle {
        color: appStyle.mainBackground
    }

    header: Rectangle {
        width: parent.width
        height: dp(42)
        color: appStyle.mainTitleBackground

        Text {
            anchors {
                left: parent.left
                verticalCenter: parent.verticalCenter
                leftMargin: d.bigSpacing
            }

            text: "/path_to_your/file"
            font.pointSize: 10
            font.bold: true
            color: appStyle.mainTitleText
        }
    }

    ListView {
        id: projectViewBrowserRow
        anchors.fill: parent
        model: appData.projectDepth
        orientation: Qt.Horizontal

        delegate: projectViewBrowser

        ScrollBar.horizontal: ScrollBar {}
    }

    Component.onCompleted: {
        let h_screen = {
            item_id: 'start_screen',
            screen_title: 'Start',
            screen_icon: IconType.flag,
            content_flickable: false
        }
        let test_screen = {
            item_id: 'test_screen',
            screen_title: 'Test',
            screen_icon: IconType.gear,
            content_flickable: false
        }

        projectPagesModel.append(h_screen)
        projectPagesModel.append(test_screen)

        ///////

        let item1 = {
            parent_id: 'start_screen',
            item_id: 'item 1'
        }

        let item2 = {
            parent_id: 'start_screen',
            item_id: 'item 2'
        }

        let item3 = {
            parent_id: 'start_screen',
            item_id: 'item 3'
        }

        let item4 = {
            parent_id: 'test_screen',
            item_id: 'item 4'
        }

        let item5 = {
            parent_id: 'test_screen',
            item_id: 'item 5'
        }

        projectContentModel.append(item1)
        projectContentModel.append(item2)
        projectContentModel.append(item3)
        projectContentModel.append(item4)
        projectContentModel.append(item5)



    }

    Component {
        id: projectViewBrowser

        Rectangle {
            property int projectViewBrowserRowIndex: index

            width: dp(256)
            height: parent.height
            color: 'transparent'
            border.width: dp(1.5)
            border.color: appStyle.lightBlue

            Text {
                anchors.centerIn: parent
                color: 'gray'
                text: "parent_id:" + parent_id
            }

            SortFilterProxyModel {
                id: projectProxyModel
                sourceModel: projectContentModel
                filters: [
                    ValueFilter {
                        roleName: "parent_id"
                        value: parent_id
                    }]
            }

            ListView {
                id: projectViewBrowserColumn
                anchors{
                    fill: parent
                    leftMargin: d.bigSpacing
                    rightMargin: d.bigSpacing
                }

                model: index === 0 ? projectPagesModel : projectProxyModel
                spacing: d.smallSpacing

                header: spacingDelegate
                delegate: projectParentDelegate
                footer: spacingDelegate
                currentIndex: -1

                ScrollBar.vertical: ScrollBar {}

                onCurrentIndexChanged: appFunctions.projectDepth.setNewDepth(model.get(currentIndex), projectViewBrowserRowIndex + 1)
            }

            Component {
                id: projectParentDelegate

                ProjectBrowserItem {
                    width: parent.width
                    height: dp(32)
                    state: projectViewBrowserColumn.currentIndex === index ? "selected" : "standard"

                    onClicked: {
                        projectViewBrowserColumn.currentIndex = index
                    }
                }
            }
        }
    }

    Component {
        id: spacingDelegate

        Item {
            width: parent.width
            height: d.standardSpacing
        }
    }
}
