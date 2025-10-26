pragma Singleton
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15

QtObject {
    // Light, airy palette
    readonly property color background: "#f4f7ff"
    readonly property color foreground: "#111827"
    readonly property color muted: "#e8edfb"
    readonly property color mutedForeground: "#4b5563"
    readonly property color card: "#ffffff"
    readonly property color border: "#d6dced"
    readonly property color accent: "#1f2933"
    readonly property color accentForeground: "#ffffff"
    readonly property color destructive: "#dc2626"
    readonly property color destructiveForeground: "#ffffff"

    // Corners & elevation
    readonly property int radiusLarge: 16
    readonly property int radiusMedium: 12
    readonly property int radiusSmall: 8
    readonly property real elevationLow: 4.0
    readonly property real elevationMedium: 10.0

    // Spacing scale
    readonly property int spacingXS: 6
    readonly property int spacingSM: 14
    readonly property int spacingMD: 22
    readonly property int spacingLG: 32
    readonly property int spacingXL: 46

    // Typography (Japanese-friendly stack)
    readonly property string fontFamilyPrimary: "\"Noto Sans JP\", \"Yu Gothic UI\", \"Segoe UI\", sans-serif"
    readonly property real fontSizeHeading: 28
    readonly property real fontSizeBody: 18
    readonly property real fontSizeBodyLarge: 20
    readonly property real fontSizeDisplay: 34
    readonly property real fontSizeCaption: 12

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
            } catch (err) {
                // ignore read-only properties (e.g. ApplicationWindow)
            }
        }
    }
}
