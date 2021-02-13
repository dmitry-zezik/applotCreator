import QtQuick 2.12
import QtQuick.Controls 2.12
import Felgo 3.0

ComboBox {
    id: comboBoxRoot
    property string textValue
    property string defaultTextValue
    property real cb_contentHeight: comboBoxListView.contentHeight

    currentIndex: -1

    delegate: ItemDelegate {
        id:itemDelegate
        width: comboBoxRoot.width
        contentItem: AppText {
            text: value
            fontSize: 12
            scale: hovered ? 1.1 : 1.0
            color: appStyle.mainText
            maximumLineCount: 1
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.WordWrap
        }

        background: Rectangle {
          radius: dp(5)
          color: 'transparent'
          width: comboBoxRoot.width
          implicitHeight: 40
        }
        highlighted: comboBoxRoot.highlightedIndex === index
    }

    indicator: Icon {
        x: comboBoxRoot.width - width - comboBoxRoot.rightPadding
        y: comboBoxRoot.topPadding + (comboBoxRoot.availableHeight - height) / 2
        icon: comboBoxRoot.popup.visible ? IconType.angleup : IconType.angledown
        color: appStyle.mainTitleText
    }

    contentItem: AppText {
        fontSize: 12
        leftPadding: 0
        rightPadding: comboBoxRoot.indicator.width + comboBoxRoot.spacing

        text: currentIndex === -1 ? defaultTextValue : textValue
        color: appStyle.mainTitleText
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        elide: Text.ElideRight
    }

    background: Rectangle {
        implicitWidth: 120
        implicitHeight: 40
        border.color: appStyle.mainTitleText
        border.width: dp(1)
        color: appStyle.mainTitleBackground
        radius: dp(5)
    }

    popup: Popup {
        y: comboBoxRoot.height - 1
        width: comboBoxRoot.width
        implicitHeight: cb_contentHeight
        padding: 1

        contentItem: ListView {
            id: comboBoxListView
            clip: true
            implicitHeight: contentHeight
            model: comboBoxRoot.popup.visible ? comboBoxRoot.delegateModel : null
            currentIndex: comboBoxRoot.highlightedIndex
            highlight: Rectangle { color: "#00ffffff"; radius: 5; width: 20; height: 20 }
//            ScrollIndicator.vertical: ScrollIndicator { }
        }

        background: Rectangle {
            border.color: appStyle.mainTitleText
            color: appStyle.mainBackground
            radius: dp(5)
        }
    }
}

