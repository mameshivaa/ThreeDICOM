pragma Singleton
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15

QtObject {
    readonly property color background: "#f7f9ff"
    readonly property color foreground: "#121826"
    readonly property color muted: "#e7ecfb"
    readonly property color mutedForeground: "#4b5567"
    readonly property color card: "#ffffff"
    readonly property color border: "#d5def0"
    readonly property color accent: "#121826"
    readonly property color accentForeground: "#ffffff"
    readonly property color destructive: "#dc2626"
    readonly property color destructiveForeground: "#ffffff"
    readonly property color success: "#15803d"
    readonly property color warning: "#b45309"

    readonly property int radiusLarge: 18
    readonly property int radiusMedium: 14
    readonly property int radiusSmall: 10
    readonly property real elevationLow: 6.0
    readonly property real elevationMedium: 14.0
    readonly property real elevationHigh: 20.0

    readonly property int spacingXS: 8
    readonly property int spacingSM: 18
    readonly property int spacingMD: 28
    readonly property int spacingLG: 44
    readonly property int spacingXL: 64

    readonly property string fontFamilyPrimary: "Roboto, Noto Sans, 'Segoe UI', sans-serif"
    readonly property real fontSizeBody: 22
    readonly property real fontSizeHeading: 30
    readonly property real fontSizeCaption: 14

    function applyTo(item) {
        if (!item) {
            return;
        }
        item.Material.theme = Material.Light;
        item.Material.background = background;
        item.Material.accent = accent;
        item.Material.primary = accent;
        item.Material.foreground = foreground;
        if ("color" in item) {
            try {
                item.color = background;
            } catch (e) {
            }
        }
    }
}

