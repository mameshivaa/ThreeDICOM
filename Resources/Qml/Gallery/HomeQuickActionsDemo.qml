import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import Components 1.0 as Components
import Blocks 1.0 as Blocks

ApplicationWindow {
    id: window
    visible: true
    width: 1500
    height: 960
    minimumWidth: 1366
    minimumHeight: 900
    title: qsTr("Home Quick Actions Demo")

    Material.theme: Material.Light
    Material.accent: Components.T3Theme.accent

    color: Components.T3Theme.background

    Component.onCompleted: Components.T3Theme.applyTo(window)

    Blocks.HomeQuickActions {
        anchors.centerIn: parent
        onActionTriggered: console.log("Action triggered:", actionId)
    }
}
