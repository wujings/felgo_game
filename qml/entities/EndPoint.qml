import QtQuick 2.0
import Felgo 3.0

EntityBase {
    property int column
    property int row

    x: row*gameScene.gridSize
    y: level.height - (column+1)*gameScene.gridSize
    id:endPoint
    entityType: "endPoint  "
    MultiResolutionImage{
        width: gameScene.gridSize/2
        height: gameScene.gridSize
        source: "../../assets/door.png"
     }
    BoxCollider{
        id:collider
        width:gameScene.gridSize/2
        height: gameScene.gridSize

        collisionTestingOnlyMode: true
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.bottom

        categories: Box.Category13
        collidesWith: Box.Category1
    }
}
