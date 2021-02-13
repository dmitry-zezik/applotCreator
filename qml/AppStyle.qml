import QtQuick 2.12
import Felgo 3.0

QtObject {
    id: appStyle // This is the main application UI settings item.

    property bool isAppDarkMode_enabled: false

    property color mainBackground: isAppDarkMode_enabled ? darkGray : '#f0f0f0'
    property color mainDeviceBackground: isAppDarkMode_enabled ? darkGray : lightMediumGray
    property color mainTitleText: isAppDarkMode_enabled ? lighterDarkGray : lightGray
    property color mainText: isAppDarkMode_enabled ? 'white' : 'black'
    property color secondaryText: isAppDarkMode_enabled ? 'white' : mediumGray
    property color mainTitleBackground: isAppDarkMode_enabled ? gray : '#414141'
    property color appSettingsRec: isAppDarkMode_enabled ? mediumGray : Qt.lighter(mediumGray, 1.1)

    // Colors definitions
    property color lightBlue: '#e0e0e0'
    property color blue: '#3b90ed'
    property color lightGray: '#e3e3e3'
    property color lightMediumGray: '#dcdcdc'
    property color mediumGray: '#858585'
    property color gray: '#4f4f4f'
    property color darkGray: '#262626'
    property color lighterDarkGray: '#3b3b3b'
}
