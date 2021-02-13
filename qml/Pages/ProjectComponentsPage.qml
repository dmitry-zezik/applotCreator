import QtQuick 2.12
import QtQuick.Controls 2.13 as C2
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.12
import Felgo 3.0

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
    }

    ListView {
        anchors.fill: parent
        model: appData.projectDepth
        orientation: Qt.Horizontal

        delegate: projectViewBrowser

        ScrollBar.horizontal: ScrollBar {}
    }

    Component.onCompleted: {
        let h_screen = {
            screen_id: 'h_screen',
            screen_title: 'Start',
            screen_icon: IconType.flag,
            content_flickable: false
        }
        let test_screen = {
            screen_id: 'test_screen',
            screen_title: 'Test',
            screen_icon: IconType.gear,
            content_flickable: false
        }

        projectPagesModel.append(h_screen)
        projectPagesModel.append(test_screen)


    }

    Component {
        id: projectViewBrowser

        Rectangle {
            width: dp(256)
            height: parent.height
            color: 'transparent'
            border.width: dp(1.5)
            border.color: appStyle.lightBlue

            SortFilterProxyModel {
                id: projectProxyModel
                sourceModel: projectContentModel
//                filters: [
//                    ValueFilter {
//                        roleName: "parent_id"
//                        value: parent_id
//                    }]
            }

            ListView {

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

                ScrollBar.vertical: ScrollBar {}
            }

            Component {
                id: projectParentDelegate

                Rectangle {
                    width: parent.width
                    height: dp(32)
                    radius: dp(5)
                    color: index === 0 ? appStyle.lightMediumGray : "transparent"

                    RowLayout {
                        anchors{
                            fill: parent
                            leftMargin: d.standardSpacing
                            rightMargin: d.standardSpacing
                        }
                        spacing: d.standardSpacing

                        Icon {
                            Layout.alignment: Qt.AlignVCenter
                            icon: screen_icon

                            color: appStyle.blue
                            opacity: 1
                        }

                        Text {
                            Layout.alignment: Qt.AlignVCenter
                            Layout.fillWidth: true

                            horizontalAlignment: Text.AlignLeft
                            text: screen_id
                            font.pointSize: 10
                            color: appStyle.darkGray
                        }

                        Icon {
                            Layout.alignment: Qt.AlignVCenter
                            icon: IconType.angleright

                            color: appStyle.darkGray
                            opacity: 1
                        }
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
