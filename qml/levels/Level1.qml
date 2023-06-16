import Felgo 3.0
import QtQuick 2.0
import "../entities"
import "../common"

import "." as Levels

Levels.LevelBase {
  id: level

  width: 42 * gameScene.gridSize // 42 because our last tile is a size 30 Ground at row 12
  AudioPlayer{
      id:audioPlayer
  }
  // you could draw your level on a graph paper and then add the tiles here only by defining their row, column and size
  Goomba{
      x: 60
      y: 100
  }
  Coin{
      x: 50
      y: 50
  }
  Ground {
    row: 0
    column: 0
    size: 7
  }
  Ground {
    row: 8
    column: 0
    size: 2
  }
  Platform {
    row: 3
    column: 3
    size: 4
  }
//  Platform {
//    row: 7
//    column: 6
//    size: 4
//  }
//  Platform {
//    row: 11
//    column: 3
//    size: 2
//  }
//  Ground {
//    row: 12
//    column: 0
//    size: 30
//  }
//  Platform {
//    row: 17
//    column: 3
//    size: 10
//  }
}
