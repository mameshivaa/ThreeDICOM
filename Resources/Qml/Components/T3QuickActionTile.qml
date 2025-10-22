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

    signal triggered()

    hoverEnabled: true
    Component.onCompleted: Theme.T3Theme.applyTo(tile)

    implicitWidth: Math.max(380, contentColumn.implicitWidth + leftPadding + rightPadding)
    implicitHeight: contentColumn.implicitHeight + topPadding + bottomPadding

    leftPadding: Theme.T3Theme.spacingLG
    rightPadding: Theme.T3Theme.spacingLG
    topPadding: Theme.T3Theme.spacingLG
    bottomPadding: Theme.T3Theme.spacingLG

    background: Rectangle {
        radius: Theme.T3Theme.radiusLarge
        color: tile.hovered ? Qt.tint(Theme.T3Theme.card, Qt.rgba(0, 0, 0, 0.08)) : Theme.T3Theme.card
        border.width: 1
        border.color: tile.hovered ? Theme.T3Theme.foreground : Theme.T3Theme.border
        Behavior on color { ColorAnimation { duration: 120 } }
    }

    contentItem: Column {
        id: contentColumn
        spacing: Theme.T3Theme.spacingMD

        Row {
            spacing: Theme.T3Theme.spacingSM
            visible: tile.iconSource !== "" || tile.shortcut.length > 0

            Rectangle {
                visible: tile.iconSource !== ""
                width: 40
                height: 40
                radius: Theme.T3Theme.radiusMedium
                color: Theme.T3Theme.foreground
                opacity: 0.08
                border.color: Theme.T3Theme.foreground

                Image {
                    anchors.centerIn: parent
                    source: tile.iconSource
                    width: 24
                    height: 24
                    fillMode: Image.PreserveAspectFit
                }
            }

            Text {
                text: tile.shortcut
                visible: tile.shortcut.length > 0
                color: Theme.T3Theme.mutedForeground
                font.family: Theme.T3Theme.fontFamilyPrimary
                font.pixelSize: Theme.T3Theme.fontSizeCaption
            }
        }

        Column {
            spacing: Theme.T3Theme.spacingSM

            Text {
                text: tile.title
                color: Theme.T3Theme.foreground
                font.family: Theme.T3Theme.fontFamilyPrimary
                font.pixelSize: Theme.T3Theme.fontSizeHeading
                font.weight: Font.DemiBold
                wrapMode: Text.WordWrap
            }

            Text {
                text: tile.description
                visible: tile.description.length > 0
                color: Theme.T3Theme.mutedForeground
                font.family: Theme.T3Theme.fontFamilyPrimary
                font.pixelSize: Theme.T3Theme.fontSizeBody
                wrapMode: Text.WordWrap
            }
        }

        Row {
            spacing: Theme.T3Theme.spacingSM
            visible: tile.busy

            BusyIndicator {
                running: tile.busy
                width: 18
                height: 18
            }

            Text {
                text: qsTr("Processing…")
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
