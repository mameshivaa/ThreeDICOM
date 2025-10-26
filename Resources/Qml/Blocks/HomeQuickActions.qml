import QtQuick 2.15
import Components 1.0 as Components

Item {
    id: root

    property real availableWidth: parent ? parent.width : 0
    property alias actionsModel: actionsModel
    signal actionTriggered(string actionId)

    readonly property real baseTileWidth: 320
    readonly property real desiredTileWidth: baseTileWidth * 5
    readonly property real tileWidth: {
        var widthHint = desiredTileWidth;
        if (availableWidth > 0) {
            widthHint = availableWidth - Components.T3Theme.spacingLG * 2;
        }
        widthHint = Math.max(baseTileWidth, widthHint);
        widthHint = Math.min(desiredTileWidth, widthHint);
        return widthHint;
    }
    readonly property real columnWidth: tileWidth + Components.T3Theme.spacingLG * 2
    readonly property real preferredWidth: columnWidth
    readonly property real preferredHeight: column.implicitHeight

    implicitWidth: column.width
    implicitHeight: column.implicitHeight
    width: implicitWidth
    height: implicitHeight

    ListModel {
        id: actionsModel
        ListElement { actionId: "openDicomFolder"; title: qsTr("DICOM を取り込む"); description: qsTr("ローカルやネットワーク上のフォルダから DICOM データを素早く読み込む。"); shortcut: "Ctrl+O" }
        ListElement { actionId: "launchSegmentation"; title: qsTr("セグメンテーションを開始"); description: qsTr("Segment Editor を開き、最新のラベルマップ編集を再開する。" ); shortcut: "Shift+S" }
        ListElement { actionId: "goToVisualization"; title: qsTr("3D ビジュアライゼーション"); description: qsTr("Volume Rendering と Models でシーンを素早く確認する。" ); shortcut: "Ctrl+3" }
        ListElement { actionId: "reviewHistory"; title: qsTr("最近のプロジェクト"); description: qsTr("最後に開いたケースへジャンプし、すぐに作業へ戻る。" ); shortcut: "Ctrl+R" }
    }

    Column {
        id: column
        anchors.horizontalCenter: parent.horizontalCenter
        width: columnWidth
        spacing: Components.T3Theme.spacingLG

        Column {
            width: parent.width
            spacing: Components.T3Theme.spacingXS

            Text {
                text: qsTr("クイックアクション")
                color: Components.T3Theme.foreground
                font.family: Components.T3Theme.fontFamilyPrimary
                font.pixelSize: Components.T3Theme.fontSizeDisplay
                font.weight: Font.DemiBold
            }

            Text {
                text: qsTr("ショートカットで頻出ワークフローへすぐにアクセス。")
                color: Components.T3Theme.mutedForeground
                font.family: Components.T3Theme.fontFamilyPrimary
                font.pixelSize: Components.T3Theme.fontSizeBodyLarge
                wrapMode: Text.WordWrap
            }
        }

        Repeater {
            model: actionsModel

            delegate: Item {
                width: column.width
                height: tileControl.implicitHeight

                Components.T3QuickActionTile {
                    id: tileControl
                    anchors.horizontalCenter: parent.horizontalCenter
                    tileWidth: root.tileWidth
                    title: model.title
                    description: model.description
                    shortcut: model.shortcut
                    busy: false
                    onTriggered: root.actionTriggered(model.actionId)
                }
            }
        }
    }
}
