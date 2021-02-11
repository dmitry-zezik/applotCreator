import QtQuick 2.12
import QtQuick.Controls 2.13 as C2
import QtQuick.Controls 2.13
import Felgo 3.0

C2.Page {
    id: projectPage

    background: Rectangle {
        color: appStyle.mainBackground
    }

    header: Rectangle {
        width: parent.width
        height: dp(42)
        color: appStyle.mainTitleBackground
    }

}
