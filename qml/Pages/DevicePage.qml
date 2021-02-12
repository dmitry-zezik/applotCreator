import QtQuick 2.12
import QtQuick.Controls 2.13 as C2
import QtQuick.Controls 2.13
import Felgo 3.0

import "../Components"

C2.Page {
    id: devicePage

    QtObject {
        id: d

        property real deviceImageWidth
        property real deviceImageHeight

        property real deviceScreenWidth
        property real deviceScreenHeight
    }

    background: Rectangle {
        color: appStyle.mainDeviceBackground
    }

    header: Rectangle {
        width: parent.width
        height: dp(42)
        color: appStyle.mainTitleBackground

        Row {
            anchors.centerIn: parent
            spacing: dp(16)

            CustomComboBox {
                id: cboxCurrentDevice
                anchors.verticalCenter: parent.verticalCenter
                width: dp(130)
                height: dp(28)
                model: appData.devicesModel
                defaultTextValue: "Select device"
                textValue: currentIndex >= 0 ? appData.devicesModel.get(currentIndex).value : ""
                onCurrentIndexChanged: {
                    appFunctions.device.setCurrentDeviceIndex(currentIndex)

                    let currentDevice = appData.devicesModel.get(currentIndex).value

                    let responseDict = appFunctions.device.setDeviceItemSize(currentDevice)
                    d.deviceImageWidth = responseDict['deviceWidth']
                    d.deviceImageHeight = responseDict['deviceHeight']

                    responseDict = appFunctions.device.setDeviceScreenSize(currentDevice)
                    d.deviceScreenWidth = responseDict['screenWidth']
                    d.deviceScreenHeight = responseDict['screenHeight']
                }
            }

//            Item {
//                width: dp(28)
//                height: dp(28)
//                anchors.verticalCenter: parent.verticalCenter
//                Icon {
//                    id: icon_enable_safeZone
//                    anchors.centerIn: parent
//                    color: appStyle.mainTitleBackground
//                    icon: dataItem.appSettings.safeZoneEnabled ? IconType.square : IconType.squareo
//                    MouseArea {
//                        anchors.centerIn: parent
//                        width: parent.width * 2
//                        height: parent.height * 2
//                        onClicked: {
//                            if (dataItem.appSettings.safeZoneEnabled === true) {
//                                dataItem.appSettings.safeZoneEnabled = false
//                            } else {
//                                dataItem.appSettings.safeZoneEnabled = true
//                            }
//                        }
//                    }
//                }
//            }
        }

    }

    Item {
        id: device
        anchors.fill: parent

        Icon {
            anchors.centerIn: parent
            color: appStyle.appSettingsRec
            opacity: 1
            icon: IconType.mobilephone
            size: dp(256)
        }

        Rectangle {
            id: deviceScreen
            anchors.centerIn: parent
            width: d.deviceScreenWidth
            height: d.deviceScreenHeight
            color: 'white'
            visible: deviceImage.status === Image.Ready

            Item {
                id: deviceScreenContent
            }

            Item {
                id: safeZone
                anchors.fill: parent
                visible: appData.device.safeZone
                Rectangle {
                    id: topZone
                    width: parent.width
                    height: dp(16)
                    color: 'red'
                    opacity: 0.5
                }
                Rectangle {
                    id: bottomZone
                    width: parent.width
                    anchors.bottom: parent.bottom
                    height: dp(16)
                    color: 'red'
                    opacity: 0.5
                }
                Rectangle {
                    id: leftZone
                    width: dp(8)
                    anchors.left: parent.left
                    anchors.top: topZone.bottom
                    anchors.bottom: bottomZone.top
                    color: 'red'
                    opacity: 0.5
                }
                Rectangle {
                    id: rightZone
                    width: dp(8)
                    anchors.right: parent.right
                    anchors.top: topZone.bottom
                    anchors.bottom: bottomZone.top
                    color: 'red'
                    opacity: 0.5
                }
            }
        }

        Image {
            id: deviceImage
            anchors.centerIn: parent
            width: d.deviceImageWidth
            height: d.deviceImageHeight
            asynchronous: true
            cache: true
            fillMode: Image.PreserveAspectFit
            smooth: true
            mipmap: true
            source: appData.device.currentIndex >= 0 ? appData.devicesModel.get(appData.device.currentIndex).source : ""
        }
    }
}
