import Felgo 3.0
import QtQuick 2.0
import"common"
import"scenes"

GameWindow {
    id: gameWindow
    activeScene: menuScene
    screenWidth: 960
    screenHeight: 640
    state: "menu"
    GameScene {
        id: gameScene
    }
    MenuScene {
      id: menuScene
      onGameScenePressed: {
        gameWindow.state = "game"
      }
    }
    states: [
      State {
        name: "menu"
        PropertyChanges {target: menuScene; opacity: 1}
        PropertyChanges {target: gameWindow; activeScene: menuScene}
      },
      State {
        name: "game"
        PropertyChanges {target: gameScene; opacity: 1}
        PropertyChanges {target: menuScene; opacity: 0}
        PropertyChanges {target: gameWindow; activeScene: gameScene}
      }
    ]
}
