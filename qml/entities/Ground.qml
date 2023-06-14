import QtQuick 2.0
import Felgo 3.0

TiledEntityBase {
  id: ground
  entityType: "ground"

  size: 2 // must be >= 2, because we got a sprite for the start, one for the end and a repeatable center sprite

//  Row {
//    id: tileRow
//    Tile {
//      pos: "left"
//      image: "../../assets/ground/left.png"
//    }
//    Repeater {
//      model: size-2
//      Tile {
//        pos: "mid"
//        image: "../../assets/ground/mid.png"
//      }
//    }
//    Tile {
//      pos: "right"
//      image: "../../assets/ground/right.png"
//    }
//  }

 Row{
          id: tileRow
          Repeater{
              model: size
              MultiResolutionImage{
                  width: gameScene.gridSize
                  height: gameScene.gridSize
                  source: "../../assets/tiles/ground.png"
              }
          }
      }
      Repeater{
          model: heightSize-1
          Row{
              Repeater{
                  model: widthSize
                  MultiResolutionImage{
                      width: gameScene.gridSize
                      height: gameScene.gridSize
                      source:dirt
                  }
              }
          }
      }
  BoxCollider {
    anchors.fill: parent
    bodyType: Body.Static
    fixture.onBeginContact: {
      var otherEntity = other.getBody().target
      if(otherEntity.entityType === "player") player.contacts++
    }
    fixture.onEndContact: {
      var otherEntity = other.getBody().target
      if(otherEntity.entityType === "player") player.contacts--
    }
  }
}
