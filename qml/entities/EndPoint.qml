import QtQuick 2.0
import Felgo 3.0

EntityBase {
    id:endPoint
    entityType: "endPoint  "

    Rectangle {
        width: 50
        height: 50
        color: "red"
    }
    MultiResolutionImage{
        width: gameScene.gridSize/2
        height: gameScene.gridSize
        source: "../../assets/door.png"
     }
}
