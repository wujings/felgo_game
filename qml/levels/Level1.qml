import Felgo 3.0
import QtQuick 2.0
import "../entities"
import "../common"

import "." as Levels

Levels.LevelBase {
  id: level

  width: 42 * gameScene.gridSize // 42 because our last tile is a size 30 Ground at row 12
  // you could draw your level on a graph paper and then add the tiles here only by defining their row, column and size
  Goomba{
      row: 4
      column: 6
  }


  Ground {
    row: 0
    column: 1
    widthSize: 9
    heightSize: 2
  }

  Ground {
    row: 24
    column: 5
    widthSize: 8
    heightSize: 6
  }
  Troopa{
      row:24
      column:7
  }
  Coin{
      row: 24
      column: 7
  }
  Coin{
      row: 25
      column: 8
  }
  Coin{
      row: 26
      column: 9
  }

  Qblock{
      row: 18
      column: 12
  }
  Platform {
    row: 4
    column: 5
    widthSize: 4
  }
  Mushroom{
    row:7
    column:6
  }
  Platform {
    row: 8
    column: 9
    widthSize: 4
  }
  Platform {
    row: 16
    column: 9
    widthSize: 4
  }
  Goomba{
      row: 16
      column: 10
  }

  Coin{
      row: 8
      column: 10
  }
  Coin{
      row: 8
      column: 11
  }

  Spike{
      row: 4
      column: 7
      widthSize:2
  }
  Platform {
    row: 12
    column: 9
    widthSize: 6
  }
  Platform {
    row: 32
    column: 9
    widthSize: 5
  }
  Spike{
      row: 38
      column: 6
      widthSize:3
  }
  Ground {
    row: 43
    column: 5
    widthSize: 1
    heightSize: 7
  }
  Ground {
    row: 44
    column: 5
    widthSize: 12
    heightSize: 6
  }
  Troopa{
      row:47
      column:7
  }
  Goomba{
      row: 48
      column: 6
  }
  Platform {
    row: 52
    column: 9
    widthSize: 8
  }
  Goomba{
      row: 55
      column: 12
  }
  Ground {
    row: 64
    column: 1
    widthSize: 12
    heightSize: 2
  }
  Spike{
      row: 65
      column: 6
      widthSize:3
  }
  Platform {
    row: 78
    column: 2
    widthSize: 3
  }
  Platform {
    row: 85
    column: 3
    widthSize: 3
  }
  Platform {
    row: 92
    column: 4
    widthSize: 3
  }
  Platform {
    row: 88
    column: 8
    widthSize: 4
  }
  Platform {
    row: 98
    column: 11
    widthSize: 5
  }
  Goomba{
      row: 100
      column: 12
  }
  Ground {
    row: 103
    column: 5
    widthSize: 3
    heightSize: 7
  }
  EndPoint{
      row:104
      column: 6
  }
}
