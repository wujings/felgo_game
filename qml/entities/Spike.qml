import QtQuick 2.0
import Felgo 3.0

TiledEntityBase {
  id: spike
  entityType: "spike"

  widthSize: 2

  Row{
           id: tileRow
           Repeater{
               model: widthSize
               MultiResolutionImage{
                   width: gameScene.gridSize
                   height: gameScene.gridSize
                   source: "../../assets/tiles/spike.png"
               }
           }
       }
  BoxCollider {
    id: collider
    anchors.fill: parent
    bodyType: Body.Static
    categories: Box.Category8 //spike

    fixture.onBeginContact: {
      var otherEntity = other.getBody().target
      if(otherEntity.entityType === "player") {
        console.debug("contact spike begin")
        player.die()
      }
    }

    fixture.onEndContact: {
      var otherEntity = other.getBody().target
      if(otherEntity.entityType === "player") {
        console.debug("contact platform end")
      }
    }
  }
}
