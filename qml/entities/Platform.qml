import QtQuick 2.0
import Felgo 3.0

TiledEntityBase {
  id: platform
  entityType: "platform"

  widthSize:2

  Row{
           id: tileRow
           Repeater{
               model: widthSize
               MultiResolutionImage{
                   width: gameScene.gridSize
                   height: gameScene.gridSize
                   source: "../../assets/tiles/block.png"
               }
           }
       }
  BoxCollider {
    id: collider
    anchors.fill: parent
    bodyType: Body.Static
    categories: Box.Category5

    fixture.onBeginContact: {
        var otherEntity = other.getBody().target
        if(otherEntity.entityType === "player") {
            console.debug("contact platform begin")

            // increase the number of active contacts the player has
            player.contacts++
            player.jumpCount = 0
        }
    }

    fixture.onEndContact: {
      var otherEntity = other.getBody().target
      if(otherEntity.entityType === "player") {
        console.debug("contact platform end")
        // if the player leaves a platform, we decrease its number of active contacts
        player.contacts--
      }
    }
  }
}
