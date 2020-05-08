using Toybox.WatchUi;

class DiceDelegate extends WatchUi.BehaviorDelegate {
    hidden var view;
    hidden var random_stream;

    function initialize(view, random_stream) {
        self.view = view;
        self.random_stream = random_stream;
        BehaviorDelegate.initialize();
        self.onNextMode();
    }

    function onNextPage() {
        return self.onNextMode();
    }

    function onSelect() {
        return self.onNextMode();
    }

    function onNextMode() {
        self.view.dice_values[:d4] = 1 + random_stream.randint(4);
        self.view.dice_values[:d6] = 1 + random_stream.randint(6);
        self.view.dice_values[:d8] = 1 + random_stream.randint(8);
        self.view.dice_values[:d10] = 1 + random_stream.randint(10);
        self.view.dice_values[:d12] = 1 + random_stream.randint(12);
        self.view.dice_values[:d20] = 1 + random_stream.randint(20);
        self.view.dice_values[:d100] = 1 + random_stream.randint(100);
        WatchUi.requestUpdate();
    }

    function onMenu() {
    }

}
