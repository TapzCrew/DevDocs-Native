import QtQuick 6.3
import QtQuick.Controls 6.3
import QtQuick.Layouts 6.3

import WinUI3Style 1.0
import WinUI3Style.Addons 1.0

import "." as App

MicaApplicationWindow {
    id: window

    width: 640
    height: 480

    minimumWidth: 500
    minimumHeight: 200

    visible: true
    title: qsTr("Gallery")

    WinUI3Style.theme: WinUI3Style.Theme.Dark

    titleBarExpanded: true
    property var stack_indices: []

    titleBar: Row {
        id: titlebar

        spacing: 6

        leftPadding: 4
        topPadding: 4

        Row {
            spacing: 4

            ToolButton {
                font.family: WinUI3Style.iconFont
                text: String.fromCodePoint(0xe790)

                onClicked: window.WinUI3Style.theme = (window.WinUI3Style.theme === WinUI3Style.Theme.Dark) ? WinUI3Style.Theme.Light : WinUI3Style.Theme.Dark
            }
        }

        Label {
            id: window_title

            text: window.title

            anchors.verticalCenter: parent.verticalCenter

            font.pixelSize: 12
            font.weight: 450
            font.family: "Segoe UI Semibold"
        }
    }

    WebView {
        id: webview
        url: "https://www.google.fr"
    }
}
