import QtQuick 2.12
import Felgo 3.0

Item {

    property alias device: device
    property alias projectDepth: projectDepth

    QtObject {
        id: device

        function setCurrentDeviceIndex(currentIndex) {
            appData.device.currentIndex = currentIndex
        }

        function setDeviceItemSize(currentDevice) {
            let devicePhysicalWidth
            let devicePhysicalHeight

            switch(currentDevice) {
                case 'iPhone X':
                    devicePhysicalWidth = 70.9
                    devicePhysicalHeight = 143.6
            }

            let response = {
                'deviceWidth': rootAvailableWidth * (devicePhysicalWidth / pxToMmWidth),
                'deviceHeight': rootAvailableHeight * (devicePhysicalHeight / pxToMmHeight)
            }

            return response
        }

        function setDeviceScreenSize(currentDevice) {
            let screenPhysicalWidth
            let screenPhysicalHeight

            switch(currentDevice) {
                case 'iPhone X':
                    screenPhysicalWidth = 62.64
                    screenPhysicalHeight = 135.86
            }

            let response = {
                'screenWidth': rootAvailableWidth * (screenPhysicalWidth / pxToMmWidth),
                'screenHeight': rootAvailableHeight * (screenPhysicalHeight / pxToMmHeight)
            }

            return response
        }
    }

    QtObject {
        id: projectDepth

        function setNewDepth(currentItem, rowIndex) {
            let currentItemId = currentItem['item_id']
            let removeItemsCount = appData.projectDepth.count - rowIndex

            if (appData.projectDepth.count > rowIndex) {
                appData.projectDepth.remove(rowIndex, removeItemsCount)
            }

            appData.projectDepth.append({"parent_id": currentItemId})
        }
    }
}
