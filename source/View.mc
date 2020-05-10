using Toybox.Math;
using Toybox.System;
using Toybox.WatchUi;

class DiceView extends WatchUi.View {
    var dice_values = {:d4=>0, :d6=>0, :d8=>0, :d10=>0,
                       :d12=>0, :d20=>0, :d100=>0};
    var dice_coords = [[0, 0], [0, 0], [0, 0], [0, 0],
                       [0, 0], [0, 0], [0, 0]];
    var dice_font;

    function initialize() {
        View.initialize();
    }

    // Load your resources here
    function onLayout(dc) {
        var width = dc.getWidth();
        var height = dc.getHeight();
        // radius to place non-central shapes at
        var radius_x = width*0.333;
        var radius_y = height*0.333;

        self.dice_coords[0] = [width/2, height/2];

        var x, y, theta;
        for(var i = 0; i < 6; i++) {
            theta = -(i + 2.5)*Math.PI/3;
            x = 0.5*width + radius_x*Math.cos(theta);
            y = 0.5*height - radius_y*Math.sin(theta);
            self.dice_coords[i + 1][0] = x.toNumber();
            self.dice_coords[i + 1][1] = y.toNumber();
        }

        var shape_radius = width/6;

        if(width < 150) {
            self.dice_font = WatchUi.loadResource(Rez.Fonts.dice_font_48);
        }
        else if(width > 300) {
            self.dice_font = WatchUi.loadResource(Rez.Fonts.dice_font_128);
        }
        else {
            self.dice_font = WatchUi.loadResource(Rez.Fonts.dice_font_72);
        }
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
    }

    // Update the view
    function onUpdate(dc) {
        var centering = Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER;
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);

        dc.setColor(0x550000, Graphics.COLOR_TRANSPARENT);
        dc.drawText(self.dice_coords[1][0], self.dice_coords[1][1],
                    self.dice_font, "r", centering);
        dc.setColor(0xFF5555, Graphics.COLOR_TRANSPARENT);
        dc.drawText(self.dice_coords[1][0], self.dice_coords[1][1],
                    self.dice_font, "R", centering);
        dc.setColor(0x005500, Graphics.COLOR_TRANSPARENT);
        dc.drawText(self.dice_coords[2][0], self.dice_coords[2][1],
                    self.dice_font, "c", centering);
        dc.setColor(0x55AA55, Graphics.COLOR_TRANSPARENT);
        dc.drawText(self.dice_coords[2][0], self.dice_coords[2][1],
                    self.dice_font, "C", centering);
        dc.setColor(0x000055, Graphics.COLOR_TRANSPARENT);
        dc.drawText(self.dice_coords[3][0], self.dice_coords[3][1],
                    self.dice_font, "o", centering);
        dc.setColor(0x5555AA, Graphics.COLOR_TRANSPARENT);
        dc.drawText(self.dice_coords[3][0], self.dice_coords[3][1],
                    self.dice_font, "O", centering);
        dc.setColor(0x005555, Graphics.COLOR_TRANSPARENT);
        dc.drawText(self.dice_coords[4][0], self.dice_coords[4][1],
                    self.dice_font, "z", centering);
        dc.setColor(0x55AAAA, Graphics.COLOR_TRANSPARENT);
        dc.drawText(self.dice_coords[4][0], self.dice_coords[4][1],
                    self.dice_font, "Z", centering);
        dc.setColor(0x550055, Graphics.COLOR_TRANSPARENT);
        dc.drawText(self.dice_coords[5][0], self.dice_coords[5][1],
                    self.dice_font, "d", centering);
        dc.setColor(0xAA55AA, Graphics.COLOR_TRANSPARENT);
        dc.drawText(self.dice_coords[5][0], self.dice_coords[5][1],
                    self.dice_font, "D", centering);
        dc.setColor(0x555500, Graphics.COLOR_TRANSPARENT);
        dc.drawText(self.dice_coords[6][0], self.dice_coords[6][1],
                    self.dice_font, "w", centering);
        dc.setColor(0xAAAA55, Graphics.COLOR_TRANSPARENT);
        dc.drawText(self.dice_coords[6][0], self.dice_coords[6][1],
                    self.dice_font, "W", centering);
        dc.setColor(0x555555, Graphics.COLOR_TRANSPARENT);
        dc.drawText(self.dice_coords[0][0], self.dice_coords[0][1],
                    self.dice_font, "i", centering);
        dc.setColor(0xAAAAAA, Graphics.COLOR_TRANSPARENT);
        dc.drawText(self.dice_coords[0][0], self.dice_coords[0][1],
                    self.dice_font, "I", centering);

        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(self.dice_coords[0][0], self.dice_coords[0][1],
                    Graphics.FONT_MEDIUM, self.dice_values[:d20].format("%u"),
                    centering);
        dc.drawText(self.dice_coords[1][0], self.dice_coords[1][1],
                    Graphics.FONT_MEDIUM, self.dice_values[:d4].format("%u"),
                    centering);
        dc.drawText(self.dice_coords[2][0], self.dice_coords[2][1],
                    Graphics.FONT_MEDIUM, self.dice_values[:d6].format("%u"),
                    centering);
        dc.drawText(self.dice_coords[3][0], self.dice_coords[3][1],
                    Graphics.FONT_MEDIUM, self.dice_values[:d8].format("%u"),
                    centering);
        dc.drawText(self.dice_coords[4][0], self.dice_coords[4][1],
                    Graphics.FONT_MEDIUM, self.dice_values[:d10].format("%u"),
                    centering);
        dc.drawText(self.dice_coords[5][0], self.dice_coords[5][1],
                    Graphics.FONT_MEDIUM, self.dice_values[:d12].format("%u"),
                    centering);
        dc.drawText(self.dice_coords[6][0], self.dice_coords[6][1],
                    Graphics.FONT_MEDIUM, self.dice_values[:d100].format("%u"),
                    centering);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    }
}
