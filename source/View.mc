using Toybox.Math;
using Toybox.System;
using Toybox.WatchUi;

class DiceView extends WatchUi.View {
    var dice_values = {:d4=>0, :d6=>0, :d8=>0, :d10=>0,
                       :d12=>0, :d20=>0, :d100=>0};
    var dice_coords = [[0, 0], [0, 0], [0, 0], [0, 0],
                       [0, 0], [0, 0], [0, 0]];
    var background = null;

    function initialize() {
        View.initialize();
    }

    // Load your resources here
    function onLayout(dc) {
        var width = dc.getWidth();
        var height = dc.getHeight();
        // radius to place non-central shapes at
        var radius = width*0.333;

        self.dice_coords[0] = [width/2, height/2];

        var x, y, theta;
        for(var i = 0; i < 6; i++) {
            theta = -(i + 2.5)*Math.PI/3;
            x = 0.5*width + radius*Math.cos(theta);
            y = 0.5*height - radius*Math.sin(theta);
            self.dice_coords[i + 1][0] = x.toNumber();
            self.dice_coords[i + 1][1] = y.toNumber();
        }

        var shape_radius = width/6;
        self.background = new Graphics.BufferedBitmap({:width=>width, :height=>height});
        var buf_dc = self.background.getDc();
        buf_dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
        buf_dc.clear();

        self.draw_d4(buf_dc, self.dice_coords[1][0], self.dice_coords[1][1], shape_radius);
        self.draw_d6(buf_dc, self.dice_coords[2][0], self.dice_coords[2][1], shape_radius);
        self.draw_d8(buf_dc, self.dice_coords[3][0], self.dice_coords[3][1], shape_radius);
        self.draw_d10(buf_dc, self.dice_coords[4][0], self.dice_coords[4][1], shape_radius*1.15);
        self.draw_d12(buf_dc, self.dice_coords[5][0], self.dice_coords[5][1], shape_radius);
        self.draw_d20(buf_dc, self.dice_coords[0][0], self.dice_coords[0][1], shape_radius*1.25);
        self.draw_d100(buf_dc, self.dice_coords[6][0], self.dice_coords[6][1], shape_radius*1.25);
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
    }

    // Update the view
    function onUpdate(dc) {
        var radius = dc.getWidth()/6;
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
        dc.drawBitmap(0, 0, self.background);

        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(self.dice_coords[0][0], self.dice_coords[0][1],
                    Graphics.FONT_MEDIUM, self.dice_values[:d20].format("%u"),
                    Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
        dc.drawText(self.dice_coords[1][0], self.dice_coords[1][1],
                    Graphics.FONT_MEDIUM, self.dice_values[:d4].format("%u"),
                    Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
        dc.drawText(self.dice_coords[2][0], self.dice_coords[2][1],
                    Graphics.FONT_MEDIUM, self.dice_values[:d6].format("%u"),
                    Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
        dc.drawText(self.dice_coords[3][0], self.dice_coords[3][1],
                    Graphics.FONT_MEDIUM, self.dice_values[:d8].format("%u"),
                    Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
        dc.drawText(self.dice_coords[4][0], self.dice_coords[4][1],
                    Graphics.FONT_MEDIUM, self.dice_values[:d10].format("%u"),
                    Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
        dc.drawText(self.dice_coords[5][0], self.dice_coords[5][1],
                    Graphics.FONT_MEDIUM, self.dice_values[:d12].format("%u"),
                    Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
        dc.drawText(self.dice_coords[6][0], self.dice_coords[6][1],
                    Graphics.FONT_MEDIUM, self.dice_values[:d100].format("%u"),
                    Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    }

    function draw_d4(dc, x, y, radius) {
        var a = [x + (0.42539*radius).toNumber(),
                 y + (0.49834*radius).toNumber()];
        var b = [x + (0.75352*radius).toNumber(),
                 y + (-0.64229*radius).toNumber()];
        var c = [x + (-0.28555*radius).toNumber(),
                 y + (0.76787*radius).toNumber()];
        var d = [x + (-0.89492*radius).toNumber(),
                 y + (-0.58760*radius).toNumber()];
        var light = 0xFF5555;
        var dark = 0x550000;
        var width = 1;

        dc.setColor(dark, dark);
        dc.fillPolygon([a, b, c]);
        dc.setColor(light, light);
        dc.fillPolygon([b, c, d]);
    }

    function draw_d6(dc, x, y, radius) {
        var a = [x + (0.80430*radius).toNumber(),
                 y + (0.55399*radius).toNumber()];
        var b = [x + (0.77695*radius).toNumber(),
                 y + (-0.68819*radius).toNumber()];
        var c = [x + (-0.41836*radius).toNumber(),
                 y + (-0.73116*radius).toNumber()];
        var d = [x + (0.42539*radius).toNumber(),
                 y + (0.71806*radius).toNumber()];
        var e = [x + (0.39805*radius).toNumber(),
                 y + (-0.51632*radius).toNumber()];
        var f = [x + (-0.79726*radius).toNumber(),
                 y + (-0.55538*radius).toNumber()];
        var g = [x + (-0.76992*radius).toNumber(),
                 y + (0.69071*radius).toNumber()];
        var light = 0x55AA55;
        var dark = 0x005500;
        var width = 1;

        dc.setColor(dark, dark);
        dc.fillPolygon([a, b, e, d]);
        dc.fillPolygon([b, c, f, e]);
        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
        dc.setPenWidth(width);
        dc.drawLine(b[0], b[1], e[0], e[1]);
        dc.setColor(light, light);
        dc.fillPolygon([d, e, f, g]);
    }

    function draw_d8(dc, x, y, radius) {
        var a = [x + (0.84336*radius).toNumber(),
                 y + (0.33839*radius).toNumber()];
        var b = [x + (0.77305*radius).toNumber(),
                 y + (-0.77879*radius).toNumber()];
        var c = [x + (0.38633*radius).toNumber(),
                 y + (0.83058*radius).toNumber()];
        var d = [x + (-0.38320*radius).toNumber(),
                 y + (-0.84911*radius).toNumber()];
        var e = [x + (-0.81289*radius).toNumber(),
                 y + (-0.34911*radius).toNumber()];
        var f = [x + (-0.76211*radius).toNumber(),
                 y + (0.79152*radius).toNumber()];
        var light = 0x5555AA;
        var dark = 0x000055;
        var width = 1;

        dc.setColor(dark, dark);
        dc.fillPolygon([a, b, c]);
        dc.fillPolygon([d, e, b]);
        dc.fillPolygon([e, f, c]);
        dc.setColor(light, light);
        dc.fillPolygon([b, e, c]);
    }

    function draw_d10(dc, x, y, radius) {
        var a = [x + (-0.50430*radius).toNumber(),
                 y + (0.51094*radius).toNumber()];
        var b = [x + (0.22617*radius).toNumber(),
                 y + (0.73750*radius).toNumber()];
        var c = [x + (-0.09023*radius).toNumber(),
                 y + (0.42500*radius).toNumber()];
        var d = [x + (-0.56289*radius).toNumber(),
                 y + (0.17110*radius).toNumber()];
        var e = [x + (0.64805*radius).toNumber(),
                 y + (0.54219*radius).toNumber()];
        var f = [x + (0.50352*radius).toNumber(),
                 y + (-0.49687*radius).toNumber()];
        var g = [x + (-0.61758*radius).toNumber(),
                 y + (-0.36015*radius).toNumber()];
        var h = [x + (-0.21914*radius).toNumber(),
                 y + (-0.73515*radius).toNumber()];
        var i = [x + (-0.64492*radius).toNumber(),
                 y + (-0.55937*radius).toNumber()];
        var light = 0x55AAAA;
        var dark = 0x005555;
        var width = 1;

        dc.setColor(dark, dark);
        dc.fillPolygon([a, b, c, d]);
        dc.fillPolygon([b, e, f, c]);
        dc.fillPolygon([f, h, i, g]);
        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
        dc.setPenWidth(width);
        dc.drawLine(b[0], b[1], c[0], c[1]);
        dc.setColor(light, light);
        dc.fillPolygon([f, g, d, c]);
    }

    function draw_d12(dc, x, y, radius) {
        var a = [x + (0.26133*radius).toNumber(),
                 y + (0.81176*radius).toNumber()];
        var b = [x + (0.63242*radius).toNumber(),
                 y + (0.53832*radius).toNumber()];
        var c = [x + (0.28867*radius).toNumber(),
                 y + (0.35082*radius).toNumber()];
        var d = [x + (-0.27773*radius).toNumber(),
                 y + (0.50707*radius).toNumber()];
        var e = [x + (-0.29336*radius).toNumber(),
                 y + (0.79223*radius).toNumber()];
        var f = [x + (0.85508*radius).toNumber(),
                 y + (0.03051*radius).toNumber()];
        var g = [x + (0.65977*radius).toNumber(),
                 y + (-0.45387*radius).toNumber()];
        var h = [x + (0.31211*radius).toNumber(),
                 y + (-0.25465*radius).toNumber()];
        var i = [x + (0.32383*radius).toNumber(),
                 y + (-0.80152*radius).toNumber()];
        var j = [x + (-0.25430*radius).toNumber(),
                 y + (-0.78590*radius).toNumber()];
        var k = [x + (-0.25039*radius).toNumber(),
                 y + (-0.46558*radius).toNumber()];
        var l = [x + (-0.63320*radius).toNumber(),
                 y + (-0.52808*radius).toNumber()];
        var m = [x + (-0.85195*radius).toNumber(),
                 y + (-0.02027*radius).toNumber()];
        var n = [x + (-0.60976*radius).toNumber(),
                 y + (0.01879*radius).toNumber()];
        var o = [x + (-0.66055*radius).toNumber(),
                 y + (0.47582*radius).toNumber()];
        var light = 0xAA55AA;
        var dark = 0x550055;
        var width = 1;

        dc.setColor(dark, dark);
        dc.fillPolygon([a, b, c, d, e]);
        dc.fillPolygon([b, f, g, h, c]);
        dc.fillPolygon([g, i, j, k, h]);
        dc.fillPolygon([j, l, m, n, k]);
        dc.fillPolygon([m, o, e, d, n]);
        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
        dc.setPenWidth(width);
        dc.drawLine(b[0], b[1], c[0], c[1]);
        dc.drawLine(g[0], g[1], h[0], h[1]);
        dc.drawLine(j[0], j[1], k[0], k[1]);
        dc.drawLine(m[0], m[1], n[0], n[1]);
        dc.drawLine(d[0], d[1], e[0], e[1]);
        dc.setColor(light, light);
        dc.fillPolygon([c, h, k, n, d]);
    }

    function draw_d20(dc, x, y, radius) {
        var a = [x + (0.41367*radius).toNumber(),
                 y + (0.68050*radius).toNumber()];
        var b = [x + (0.13242*radius).toNumber(),
                 y + (0.39925*radius).toNumber()];
        var c = [x + (-0.40273*radius).toNumber(),
                 y + (0.68832*radius).toNumber()];
        var d = [x + (-0.56289*radius).toNumber(),
                 y + (-0.01090*radius).toNumber()];
        var e = [x + (-0.76211*radius).toNumber(),
                 y + (0.01644*radius).toNumber()];
        var f = [x + (-0.41445*radius).toNumber(),
                 y + (-0.66715*radius).toNumber()];
        var g = [x + (0.14805*radius).toNumber(),
                 y + (-0.44450*radius).toNumber()];
        var h = [x + (0.39805*radius).toNumber(),
                 y + (-0.66715*radius).toNumber()];
        var i = [x + (0.75352*radius).toNumber(),
                 y + (-0.01090*radius).toNumber()];
        var light = 0xAAAAAA;
        var dark = 0x555555;
        var width = 1;

        dc.setColor(dark, dark);
        dc.fillPolygon([a, b, c]);
        dc.fillPolygon([b, d, c]);
        dc.fillPolygon([c, d, e]);
        dc.fillPolygon([e, d, f]);
        dc.fillPolygon([f, d, g]);
        dc.fillPolygon([f, g, h]);
        dc.fillPolygon([g, h, i]);
        dc.fillPolygon([i, b, a]);
        dc.fillPolygon([i, g, b]);
        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
        dc.setPenWidth(width);
        dc.drawLine(b[0], b[1], a[0], a[1]);
        dc.drawLine(b[0], b[1], c[0], c[1]);
        dc.drawLine(d[0], d[1], c[0], c[1]);
        dc.drawLine(d[0], d[1], e[0], e[1]);
        dc.drawLine(d[0], d[1], f[0], f[1]);
        dc.drawLine(f[0], f[1], g[0], g[1]);
        dc.drawLine(g[0], g[1], h[0], h[1]);
        dc.drawLine(g[0], g[1], i[0], i[1]);
        dc.drawLine(b[0], b[1], i[0], i[1]);
        dc.setColor(light, light);
        dc.fillPolygon([b, d, g]);
    }

    function draw_d100(dc, x, y, radius) {
        var a1 = [x + (-0.72695*radius).toNumber(),
                  y + (0.34660*radius).toNumber()];
        var b1 = [x + (-0.24648*radius).toNumber(),
                  y + (0.50285*radius).toNumber()];
        var c1 = [x + (-0.45351*radius).toNumber(),
                  y + (0.29973*radius).toNumber()];
        var d1 = [x + (-0.77383*radius).toNumber(),
                  y + (0.12395*radius).toNumber()];
        var e1 = [x + (0.03477*radius).toNumber(),
                  y + (0.37395*radius).toNumber()];
        var f1 = [x + (-0.07070*radius).toNumber(),
                  y + (-0.32137*radius).toNumber()];
        var g1 = [x + (-0.80898*radius).toNumber(),
                  y + (-0.22762*radius).toNumber()];
        var h1 = [x + (-0.54726*radius).toNumber(),
                  y + (-0.48152*radius).toNumber()];
        var i1 = [x + (-0.82461*radius).toNumber(),
                  y + (-0.37215*radius).toNumber()];
        var a2 = [x + (0.06602*radius).toNumber(),
                  y + (0.34270*radius).toNumber()];
        var b2 = [x + (0.55039*radius).toNumber(),
                  y + (0.49504*radius).toNumber()];
        var c2 = [x + (0.34336*radius).toNumber(),
                  y + (0.29582*radius).toNumber()];
        var d2 = [x + (0.02305*radius).toNumber(),
                  y + (0.12395*radius).toNumber()];
        var e2 = [x + (0.83164*radius).toNumber(),
                  y + (0.37395*radius).toNumber()];
        var f2 = [x + (0.73008*radius).toNumber(),
                  y + (-0.31746*radius).toNumber()];
        var g2 = [x + (-0.01211*radius).toNumber(),
                  y + (-0.23543*radius).toNumber()];
        var h2 = [x + (0.24570*radius).toNumber(),
                  y + (-0.48543*radius).toNumber()];
        var i2 = [x + (-0.02773*radius).toNumber(),
                  y + (-0.36824*radius).toNumber()];
        var light = 0xAAAA55;
        var dark = 0x555500;
        var width = 1;

        dc.setColor(dark, dark);
        dc.fillPolygon([a1, b1, c1, d1]);
        dc.fillPolygon([b1, e1, f1, c1]);
        dc.fillPolygon([f1, h1, i1, g1]);
        dc.fillPolygon([a2, b2, c2, d2]);
        dc.fillPolygon([b2, e2, f2, c2]);
        dc.fillPolygon([f2, h2, i2, g2]);
        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
        dc.setPenWidth(width);
        dc.drawLine(b1[0], b1[1], c1[0], c1[1]);
        dc.drawLine(b2[0], b2[1], c2[0], c2[1]);
        dc.setColor(light, light);
        dc.fillPolygon([f1, g1, d1, c1]);
        dc.fillPolygon([f2, g2, d2, c2]);
    }
}
