import QtQuick 2.12
import Felgo 3.0

Item {

    property alias device: device

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

}