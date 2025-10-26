import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "." as Theme

Control {
    id: card
    width: implicitWidth

    property string title: ""
    property string subtitle: ""
    property alias headerContent: headerExtras.data
    property alias footerContent: footerExtras.data
    default property alias contentData: bodySection.data

    property int cardPadding: Theme.T3Theme.spacingLG
    property int sectionSpacing: Theme.T3Theme.spacingSM

    implicitWidth: background.implicitWidth
    implicitHeight: background.implicitHeight

    Component.onCompleted: Theme.T3Theme.applyTo(card)

    background: Rectangle {
        id: background
        radius: Theme.T3Theme.radiusLarge
        color: Theme.T3Theme.card
        border.width: 1
        border.color: Theme.T3Theme.border
        implicitWidth: contentColumn.implicitWidth + cardPadding * 2
        implicitHeight: Math.max(160, contentColumn.implicitHeight + cardPadding * 2)
    }

    contentItem: Column {
        id: contentColumn
        anchors.fill: parent
        anchors.margins: cardPadding
        spacing: sectionSpacing

        Column {
            id: headerSection
            spacing: Theme.T3Theme.spacingSM
            property bool showExtras: headerExtras.children.length > 0
            visible: card.title.length > 0 || card.subtitle.length > 0 || showExtras

            Row {
                spacing: Theme.T3Theme.spacingSM
                visible: card.title.length > 0 || headerSection.showExtras

                Text {
                    text: card.title
                    visible: card.title.length > 0
                    color: Theme.T3Theme.foreground
                    font.family: Theme.T3Theme.fontFamilyPrimary
                    font.pixelSize: Theme.T3Theme.fontSizeHeading
                    font.weight: Font.DemiBold
                }

                Row {
                    id: headerExtras
                    spacing: Theme.T3Theme.spacingSM
                    visible: headerSection.showExtras
                }
            }

            Text {
                text: card.subtitle
                visible: card.subtitle.length > 0
                wrapMode: Text.WordWrap
                color: Theme.T3Theme.mutedForeground
                font.family: Theme.T3Theme.fontFamilyPrimary
                font.pixelSize: Theme.T3Theme.fontSizeBody
            }
        }

        Rectangle {
            height: headerSection.visible ? 1 : 0
            width: parent.width
            color: Theme.T3Theme.border
            visible: headerSection.visible
        }

        Column {
            id: bodySection
            spacing: sectionSpacing
        }

        Rectangle {
            height: footerRow.visible ? 1 : 0
            width: parent.width
            color: Theme.T3Theme.border
            visible: footerRow.visible
        }

        Row {
            id: footerRow
            spacing: Theme.T3Theme.spacingSM
            visible: footerExtras.children.length > 0

            Row {
                id: footerExtras
                spacing: Theme.T3Theme.spacingSM
            }
        }
    }
}
