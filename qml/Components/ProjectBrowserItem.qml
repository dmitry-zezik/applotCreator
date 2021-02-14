import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import Felgo 3.0

ListDelegate {

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
        text: item_id
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
