using Toybox.WatchUi;

class DiceDelegate extends WatchUi.BehaviorDelegate {
    hidden var view;
    hidden var random_stream;
    hidden var last_forward;

    function initialize(view, random_stream) {
        self.view = view;
        self.random_stream = random_stream;
        self.last_forward = true;
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
        if(! self.last_forward) {
            for(var i = 0; i < 7; i++) {
                self.random_stream.step();
            }
        }

        self.view.dice_values[:d4] = 1 + random_stream.randint(4, true);
        self.view.dice_values[:d6] = 1 + random_stream.randint(6, true);
        self.view.dice_values[:d8] = 1 + random_stream.randint(8, true);
        self.view.dice_values[:d10] = 1 + random_stream.randint(10, true);
        self.view.dice_values[:d12] = 1 + random_stream.randint(12, true);
        self.view.dice_values[:d20] = 1 + random_stream.randint(20, true);
        self.view.dice_values[:d100] = 1 + random_stream.randint(100, true);
        self.last_forward = true;
        WatchUi.requestUpdate();
    }

    function onPreviousMode() {
        if(self.last_forward) {
            for(var i = 0; i < 7; i++) {
                self.random_stream.step_back();
            }
        }

        self.view.dice_values[:d100] = 1 + random_stream.randint(100, false);
        self.view.dice_values[:d20] = 1 + random_stream.randint(20, false);
        self.view.dice_values[:d12] = 1 + random_stream.randint(12, false);
        self.view.dice_values[:d10] = 1 + random_stream.randint(10, false);
        self.view.dice_values[:d8] = 1 + random_stream.randint(8, false);
        self.view.dice_values[:d6] = 1 + random_stream.randint(6, false);
        self.view.dice_values[:d4] = 1 + random_stream.randint(4, false);
        self.last_forward = false;
        WatchUi.requestUpdate();
    }

    function onPreviousPage() {
        return self.onPreviousMode();
    }

    function onMenu() {
    }
}
