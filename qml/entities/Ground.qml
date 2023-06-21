import QtQuick 2.0
import Felgo 3.0

TiledEntityBase {
    id: ground
    entityType: "ground"

    widthSize:2
    Column{
        Row{
            id: tileRow
            Repeater{
                model: widthSize
                MultiResolutionImage{
                    width: gameScene.gridSize
                    height: gameScene.gridSize
                    source: "../../assets/tiles/field.png"
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
                      source:"../../assets/tiles/dirt.png"
                  }
              }
            }
        }
    }
    BoxCollider {
        anchors.fill: parent
        bodyType: Body.Static
        categories: Box.Category5
        fixture.onBeginContact: {
        var otherEntity = other.getBody().target
        if(otherEntity.entityType === "player"){
            player.contacts++
            player.jumpCount = 0
        }
    }
    fixture.onEndContact: {
    var otherEntity = other.getBody().target
    if(otherEntity.entityType === "player")
        player.contacts--
        }
    }
}
