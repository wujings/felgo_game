import Felgo 3.0
import QtQuick 2.0
import "../"

SceneBase {
  id:menuScene

  // signal indicating that the gameScene should be displayed
  signal gameScenePressed

  // background image
  Image {
    anchors.fill: menuScene.gameWindowAnchorItem
//    source: "../../assets/menuBackground.png"
  }

  // column aligns its child components within a column
  Column {
    anchors.centerIn: parent
    spacing: 20

    // play button to start game
    Rectangle {
      width: 150
      height: 50
      color: "orange"
      Image {
        id: gameSceneButton
//        source: "../../assets/playButton.png"
        anchors.centerIn: parent
      }

      MouseArea {
        id: gameSceneMouseArea
        anchors.fill: parent
        onClicked: gameScenePressed()
      }
    }

    // option button
    Rectangle {
      width: 150
      height: 50
      color: "orange"
      Image {
        id: optionSceneButton
//        source: "../../assets/scoreButton.png"
        anchors.centerIn: parent
      }
      MouseArea {
        id: optionSceneMouseArea
        anchors.fill: parent
//        onClicked:
      }
    }

  }
}
