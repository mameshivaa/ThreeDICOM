import QtQuick 2.15
import QtQuick.Layouts 1.15
import Components 1.0 as Components

Item {
    id: root
    width: 1240
    height: quickCard.implicitHeight

    property alias actionsModel: actionsModel
    signal actionTriggered(string actionId)

    ListModel {
        id: actionsModel
        ListElement {
            actionId: "openDicomFolder"
            title: qsTr("Import DICOM")
            description: qsTr("Quickly load DICOM datasets from local folders or network shares.")
            iconSource: ""
            shortcut: "Ctrl+O"
        }
        ListElement {
            actionId: "launchSegmentation"
            title: qsTr("Start Segmentation")
            description: qsTr("Open Segment Editor and continue refining your latest label map.")
            iconSource: ""
            shortcut: "Shift+S"
        }
        ListElement {
            actionId: "goToVisualization"
            title: qsTr("3D Visualization")
            description: qsTr("Review volume rendering and models to validate the current scene.")
            iconSource: ""
            shortcut: "Ctrl+3"
        }
        ListElement {
            actionId: "reviewHistory"
            title: qsTr("Recent Projects")
            description: qsTr("Jump back into the most recently opened case and resume work instantly.")
            iconSource: ""
            shortcut: "Ctrl+R"
        }
    }

    Components.T3Card {
        id: quickCard
        anchors.horizontalCenter: parent.horizontalCenter
        width: Math.min(parent.width - Components.T3Theme.spacingLG * 2, 1120)
        title: qsTr("Quick Actions")
        subtitle: qsTr("One-click access to the most common workflows and shortcuts.")

        bodyContent: Column {
            spacing: Components.T3Theme.spacingLG
            width: quickCard.width

            GridLayout {
                id: actionsGrid
                width: quickCard.width - Components.T3Theme.spacingLG * 2
                anchors.horizontalCenter: parent.horizontalCenter
                columnSpacing: Components.T3Theme.spacingLG
                rowSpacing: Components.T3Theme.spacingLG
                columns: width < 860 ? 1 : 2

                Repeater {
                    model: actionsModel

                    delegate: Components.T3QuickActionTile {
                        property real cellWidth: Math.max(
                            360,
                            Math.floor(
                                (actionsGrid.width - (actionsGrid.columns - 1) * actionsGrid.columnSpacing)
                                / actionsGrid.columns
                            )
                        )

                        Layout.preferredWidth: cellWidth
                        Layout.minimumWidth: cellWidth
                        Layout.maximumWidth: cellWidth
                        Layout.preferredHeight: implicitHeight

                        title: model.title
                        description: model.description
                        iconSource: model.iconSource
                        shortcut: model.shortcut
                        busy: false

                        onTriggered: root.actionTriggered(model.actionId)
                    }
                }
            }
        }
    }
}
