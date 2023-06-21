import QtQuick 2.0
import Felgo 3.0

EntityBase {
    id: monster
    //base class of enemy
    entityType: "monster"
    signal contact
    property int column
    property int row



    x: row*gameScene.gridSize
    y: level.height - (column+1)*gameScene.gridSize

//    property int startX:x
//    property int startY:y

    property bool hidden: false
    property bool alive: true
    property int direction:-1

//    width: image.width
//    height: image.height

}
