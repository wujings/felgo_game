import QtQuick 2.0
import Felgo 3.0

Item {

    id: audioPlayer
//   Background Music
    BackgroundMusic {
      id: mainTheme

      autoPlay: true

      source: "../../assets/music/theme.mp3"
    }

}
