import QtQuick 2.0
import Felgo 3.0

// EMPTY SCENE
Scene {
    id: sceneBase

    width: 480
    height: 320

    visible: opacity > 0

    // only enable scene if it is visible.
    enabled: visible
}
