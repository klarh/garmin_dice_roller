using Toybox.Application;
using Toybox.Time;
using Toybox.WatchUi;

using RandomStream;

class DiceApp extends Application.AppBase {
    protected var random_stream;

    function initialize() {
        AppBase.initialize();
    }

    // onStart() is called on application start up
    function onStart(state) {
        var time = Toybox.Time.now();
        self.random_stream = RandomStream.default_v1(time.value());
    }

    // onStop() is called when your application is exiting
    function onStop(state) {
    }

    // Return the initial view of your application here
    function getInitialView() {
        var view = new DiceView();
        return [view, new DiceDelegate(view, self.random_stream)];
    }

}
