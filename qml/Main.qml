import Felgo 3.0
import QtQuick 2.12
import QtQuick.Window 2.12

// You get free licenseKeys from https://felgo.com/licenseKey
// With a licenseKey you can:
//  * Publish your games & apps for the app stores
//  * Remove the Felgo Splash Screen or set a custom one (available with the Pro Licenses)
//  * Add plugins to monetize, analyze & improve your apps (available with the Pro Licenses)
//licenseKey: "<generate one from https://felgo.com/licenseKey>"

App {
    id: root
    menuBarFelgoEnabled: false
    screenHeight: 750
    screenWidth: 1200
    title: "Applot Creator"

    readonly property real rootAvailableHeight: Screen.desktopAvailableHeight
    readonly property real rootAvailableWidth: Screen.desktopAvailableWidth
    readonly property real pxToMmHeight: Screen.desktopAvailableHeight / Screen.pixelDensity // screen height in mm
    readonly property real pxToMmWidth: Screen.desktopAvailableWidth / Screen.pixelDensity // screen width in mm

    readonly property int iphone11ProMaxHeight: 158 // mm
    readonly property int iphone11ProMaxWidth: 78 // mm

    minimumHeight: (Screen.desktopAvailableHeight * (iphone11ProMaxHeight / pxToMmHeight)) + dp(64)
    minimumWidth: ((Screen.desktopAvailableWidth * (iphone11ProMaxWidth / pxToMmWidth)) * 3) + dp(64)

    //

    signal signalAppBackKey()

    property alias appStyle: appStyle
    property alias appData: appData
    property alias appFunctions: appFunctions

    Item { // appContent
        id: contentItem
        anchors.fill: parent

        MainApp {
            id: mainApp
        }

        // App keys policy
        focus: true
        Keys.enabled: true
        Keys.priority: Keys.BeforeItem

        Keys.onBackPressed: {
            signalAppBackKey()
            event.accepted = true
        }
    }

    Item { // appData
        id: dataItem
        anchors.fill: parent

        AppStyle {
            id: appStyle
        }

        AppData {
            id: appData
        }

        AppFunctions {
            id: appFunctions
        }

//        DataModule {
//            id: dataModule
//        }

//        Storage {
//            id: appStorage
//        }
    }
}
