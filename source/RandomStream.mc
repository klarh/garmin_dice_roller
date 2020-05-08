
class RandomStream {
    protected var a;
    protected var m;
    protected var state;

    function initialize(seed, a, m) {
        self.a = a;
        self.m = m;
        self.state = seed.toLong();
    }

    function mix(value) {
        self.state += value;
    }

    function step() {
        self.state = (self.a*self.state)%self.m;
        return self.state;
    }

    function randint(maxval) {
        var state = self.step();
        if(state >= (state + self.m - 1)/self.m*self.m) {
            return self.randint(maxval);
        }

        return state%maxval;
    }

    static function default_v1(seed) {
        return new RandomStream(seed, 1583458089, 2147483647);
    }
}
