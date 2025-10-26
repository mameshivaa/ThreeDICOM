import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import "." as Theme

Button {
    id: control

    enum Variant {
        Primary,
        Secondary,
        Outline,
        Ghost,
        Destructive
    }

    property int variant: Primary
    property bool subtle: false

    implicitHeight: 56
    implicitWidth: Math.max(180, contentItem.implicitWidth + leftPadding + rightPadding)
    spacing: Theme.T3Theme.spacingSM
    leftPadding: Theme.T3Theme.spacingMD
    rightPadding: Theme.T3Theme.spacingMD
    topPadding: Theme.T3Theme.spacingSM
    bottomPadding: Theme.T3Theme.spacingSM

    font.family: Theme.T3Theme.fontFamilyPrimary
    font.pixelSize: Theme.T3Theme.fontSizeBody
    font.weight: Font.DemiBold

    Material.theme: Material.Light
    Material.accent: Theme.T3Theme.accent
    Material.foreground: Theme.T3Theme.foreground

    Component.onCompleted: Theme.T3Theme.applyTo(control)

    background: Rectangle {
        implicitHeight: 56
        radius: Theme.T3Theme.radiusLarge
        border.width: variant === Outline ? 2 : 0
        color: {
            switch (variant) {
            case Primary:
                return Theme.T3Theme.accent
            case Secondary:
                return Theme.T3Theme.muted
            case Outline:
            case Ghost:
                return "transparent"
            case Destructive:
                return Theme.T3Theme.destructive
            default:
                return Theme.T3Theme.accent
            }
        }
        border.color: {
            switch (variant) {
            case Outline:
                return Theme.T3Theme.foreground
            case Ghost:
                return "transparent"
            default:
                return Qt.darker(color, 1.15)
            }
        }
        opacity: subtle ? 0.85 : 1.0

        Behavior on opacity { NumberAnimation { duration: 120 } }
    }

    contentItem: Row {
        spacing: Theme.T3Theme.spacingSM
        anchors.verticalCenter: parent.verticalCenter

        Loader {
            active: control.icon.source !== ""
            anchors.verticalCenter: parent.verticalCenter
            sourceComponent: Item {
                width: 28
                height: 28

                Image {
                    anchors.centerIn: parent
                    source: control.icon.source
                    width: 24
                    height: 24
                    fillMode: Image.PreserveAspectFit
                }
            }
        }

        Text {
            text: control.text
            visible: text.length > 0
            font: control.font
            color: control.variant === Primary || control.variant === Destructive
                   ? Theme.T3Theme.accentForeground
                   : (control.variant === Outline || control.variant === Ghost
                      ? Theme.T3Theme.foreground
                      : Theme.T3Theme.foreground)
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
    }
}
