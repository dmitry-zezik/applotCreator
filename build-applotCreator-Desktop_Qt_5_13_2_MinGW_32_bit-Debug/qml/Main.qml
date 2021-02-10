import Felgo 3.0
import QtQuick 2.12

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

    signal signalAppBackKey()

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

//        DataModule {
//            id: dataModule
//        }

//        Storage {
//            id: appStorage
//        }
    }

}
