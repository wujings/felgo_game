import QtQuick 2.0
import Felgo 3.0

TiledEntityBase {
  id: qblock
  entityType: "qblock"

    widthSize:2

  Row{
           id: tileRow
           Repeater{
               model: widthSize
               MultiResolutionImage{
                   width: gameScene.gridSize
                   height: gameScene.gridSize
                   source: "../../assets/qblock/qblock-0.png"
               }
           }
       }
  BoxCollider {
    id: collider
    anchors.fill: parent
    bodyType: Body.Static
    categories: Box.Category9

    fixture.onBeginContact: {
      var otherEntity = other.getBody().target
      if(otherEntity.entityType === "player") {
        console.debug("contact qblock begin")

        // increase the number of active contacts the player has
        player.contacts++
      }
    }

    fixture.onEndContact: {
      var otherEntity = other.getBody().target
      if(otherEntity.entityType === "player") {
        console.debug("contact qblock end")
        // if the player leaves a platform, we decrease its number of active contacts
        player.contacts--
      }
    }
  }
}
