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
    AudioPlayer{
      id: audioPlayer
    }
    MenuScene {
        id: menuScene
        onGameScenePressed: {
            gameWindow.state = "game"
        }
    }
    GameScene {
        id: gameScene
    }
    DeadScene{
        id: deadScene
        onRetryPressed:
        {
            gameWindow.state = "game"
        }
    }

    states: [
      State {
        name: "menu"
        PropertyChanges {target: deadScene; opacity: 0}
        PropertyChanges {target: menuScene; opacity: 1}
        PropertyChanges {target: gameWindow; activeScene: menuScene}
      },
      State {
        name: "game"
        PropertyChanges {target: deadScene; opacity: 0}
        PropertyChanges {target: gameScene; opacity: 1}
        PropertyChanges {target: menuScene; opacity: 0}
        PropertyChanges {target: gameWindow; activeScene: gameScene}
      },
      State{
            name: "dead"
            PropertyChanges {target: deadScene; opacity: 1}
            PropertyChanges {target: gameScene; opacity: 0}
            PropertyChanges {target: menuScene; opacity: 0}
            PropertyChanges {target: gameWindow; activeScene: deadScene}
        }
    ]
}
