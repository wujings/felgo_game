import QtQuick 2.0
import Felgo 3.0

TiledEntityBase {
  id: spike
  entityType: "spike"

  size: 2 // must be >= 2 and even (2,4,6,...), because we got a sprite for the start, one for the end and 2 center sprites that are only repeatable if both are used

  Row{
           id: tileRow
           Repeater{
               model: size
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
