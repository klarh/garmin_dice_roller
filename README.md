
# Introduction

This is a very simple app for [Garmin
ConnectIQ](https://developer.garmin.com/connect-iq/overview/) watches
to provide random numbers for tabletop games. It may serve as a useful
example for:

- Building ConnectIQ apps on Linux
- Building ConnectIQ apps without using the Eclipse plugin
- Rendering antialiased graphics using custom fonts

# Linux prerequisites

For the most part, the [Garmin
SDK](https://developer.garmin.com/connect-iq/sdk/) is easy enough to
install and use; it does require `webkitgtk2`, however, which is
available on the AUR on arch linux.

This project also uses:

- inkscape (available from your package repository): for editing and converting font glyphs
- cairosvg (package repository): for rasterizing individual glyphs
- [plato](https://github.com/glotzerlab/plato): for creating the source SVGs for the font

# Building

The project uses a standard makefile.

- `make build` will compile the watchapp for a particular device
- `make run` will run the app in an emulator window
- `make release/app.iq` will compile the app for upload to the ConnectIQ store

# Rendering antialiased images

To improve the graphics, I tried several tricks before settling on the
current approach. I wanted something that would be easy to tweak as a
part of this pipeline, without a lot of manual steps in GUI programs.

The first font-focused strategy I tried was making an SVG font using
inkscape, then converting that font to a .fnt using fontforge. It
turns out that the .fnt format that fontforge supports is not the same
as the one required by the ConnectIQ SDK, however. Furthermore, I had
a hard time automatically getting the glyphs to be placed exactly as I
wanted. Instead, I went for the approach of manually rasterizing the
glyphs myself using the `make_font.py` script provided here.

# Other projects to check out

- [garmin-connect-seed](https://github.com/danielsiwiec/garmin-connect-seed) - Seed for projects using a Makefile in a similar process used here
- [garmin-drawaa](https://github.com/sunpazed/garmin-drawaa) - Sample library to draw antialiased graphics primitives
- [garmin-tilemapper](https://github.com/sunpazed/garmin-tilemapper) - Tool to convert graphics into fonts for antialiased rendering
- [Hiero](https://github.com/libgdx/libgdx/wiki/Hiero) - Cross-platform java application that can convert fonts (like TTFs) to the .fnt format used by the Garmin SDK (an alternative to BMfont)
