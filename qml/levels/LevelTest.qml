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
      x: 65
      y: 100
  }
  Troopa{
      x:60
      y:100
  }
  Coin{
      row: 8
      column: 6
  }
  Ground {
    row: 0
    column: 1
    widthSize: 7
    heightSize: 2
  }

  Ground {
    row: 8
    column: 0
    widthSize: 2
  }
  Qblock{
  }
  Platform {
    row: 3
    column: 5
    widthSize: 4
  }
  Platform {
    row: 8
    column: 9
    widthSize: 4
  }
  Spike{
      row: 4
      column: 7
      widthSize:2
  }
}
