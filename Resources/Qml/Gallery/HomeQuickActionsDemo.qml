import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import Components 1.0 as Components
import Blocks 1.0 as Blocks

ApplicationWindow {
    id: window
    visible: true
    property int horizontalPadding: Components.T3Theme.spacingXL * 2
    property int verticalPadding: Components.T3Theme.spacingXL * 2
    width: quickActions.preferredWidth + horizontalPadding
    height: quickActions.preferredHeight + verticalPadding
    minimumWidth: quickActions.baseTileWidth + Components.T3Theme.spacingLG * 2 + horizontalPadding
    minimumHeight: quickActions.preferredHeight + verticalPadding
    title: qsTr("Home Quick Actions Demo")

    Material.theme: Material.Light
    Material.accent: Components.T3Theme.accent

    color: Components.T3Theme.background

    Component.onCompleted: Components.T3Theme.applyTo(window)

    Blocks.HomeQuickActions {
        id: quickActions
        anchors.centerIn: parent
        availableWidth: Math.max(baseTileWidth + Components.T3Theme.spacingLG * 2,
                                 window.width - window.horizontalPadding)
        onActionTriggered: console.log("Action triggered:", actionId)
    }
}
