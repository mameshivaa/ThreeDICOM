import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import "." as Theme

Control {
    id: tile

    property string title: ""
    property string description: ""
    property string iconSource: ""
    property string shortcut: ""
    property bool busy: false
    property real tileWidth: 320

    signal triggered()

    hoverEnabled: true
    Component.onCompleted: Theme.T3Theme.applyTo(tile)

    width: tileWidth
    implicitHeight: contentColumn.implicitHeight + topPadding + bottomPadding

    leftPadding: Theme.T3Theme.spacingLG
    rightPadding: Theme.T3Theme.spacingLG
    topPadding: Theme.T3Theme.spacingLG
    bottomPadding: Theme.T3Theme.spacingLG

    background: Rectangle {
        radius: Theme.T3Theme.radiusLarge
        color: tile.hovered ? Qt.tint(Theme.T3Theme.card, Qt.rgba(17/255, 24/255, 39/255, 0.06)) : Theme.T3Theme.card
        border.width: 1
        border.color: tile.hovered ? Theme.T3Theme.accent : Theme.T3Theme.border
        Behavior on color { ColorAnimation { duration: 120 } }
        Behavior on border.color { ColorAnimation { duration: 120 } }
    }

    contentItem: Column {
        id: contentColumn
        spacing: Theme.T3Theme.spacingSM
        width: tile.width - leftPadding - rightPadding

        Row {
            spacing: Theme.T3Theme.spacingXS
            visible: tile.shortcut.length > 0
            width: parent.width

            Text {
                text: tile.shortcut
                color: Theme.T3Theme.mutedForeground
                font.family: Theme.T3Theme.fontFamilyPrimary
                font.pixelSize: Theme.T3Theme.fontSizeCaption
                font.letterSpacing: 1
                font.weight: Font.DemiBold
                width: parent.width
            }
        }

        Column {
            spacing: Theme.T3Theme.spacingXS
            width: parent.width

            Text {
                text: tile.title
                color: Theme.T3Theme.foreground
                font.family: Theme.T3Theme.fontFamilyPrimary
                font.pixelSize: Theme.T3Theme.fontSizeDisplay
                font.weight: Font.DemiBold
                wrapMode: Text.WordWrap
                width: parent.width
            }

            Text {
                text: tile.description
                visible: tile.description.length > 0
                color: Theme.T3Theme.mutedForeground
                font.family: Theme.T3Theme.fontFamilyPrimary
                font.pixelSize: Theme.T3Theme.fontSizeBodyLarge
                font.weight: Font.Medium
                wrapMode: Text.WordWrap
                width: parent.width
            }
        }

        Row {
            spacing: Theme.T3Theme.spacingXS
            visible: tile.busy
            width: parent.width

            BusyIndicator {
                running: tile.busy
                width: 16
                height: 16
            }

            Text {
                text: qsTr("読み込み中…")
                color: Theme.T3Theme.mutedForeground
                font.family: Theme.T3Theme.fontFamilyPrimary
                font.pixelSize: Theme.T3Theme.fontSizeCaption
            }
        }
    }

    TapHandler {
        onTapped: tile.triggered()
    }
}
