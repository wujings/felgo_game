function func() {
//    "use strict";

    function forcePortraitLandscape()
    {
        var public = {};

        // Variables
        var forceLandscape = false;
        var forcePortrait = false;

        // Functions
        public.setForceLandscape = function(value)
        {
            forceLandscape = value;
            forcePortrait = !forceLandscape;
        };
        public.setForcePortrait = function(value)
        {
            forcePortrait = value;
            forceLandscape = !forcePortrait;
        };

        // Bindings
        Qt.binding(function() {
            var orientation = Qt.orientation;

            if (forceLandscape && orientation === Qt.PortraitOrientation)
            {
                Qt.forceTouchToOrientation(Qt.LandscapeOrientation);
            }

            if (forcePortrait && orientation === Qt.LandscapeOrientation)
            {
                Qt.forceTouchToOrientation(Qt.PortraitOrientation);
            }
        });

        return public;
    }

}
