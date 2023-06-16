import QtQuick 2.0
import Felgo 3.0

EntityBase {
    id: monster
    //base class of enemy
    //enabled:
    entityType: "monster"
    signal contact
    property int column
    property int row
    x:(column-1)*gameScene.gridSize
    y:gameScene.gridSize*20 - row*gameScene.gridSize

    property bool hidden: false
    property bool alive: true
    property int direction:-1
    width: image.width
    height: image.height

}
