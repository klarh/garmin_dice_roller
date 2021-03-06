
device?=vivoactive4s

.PHONY: all
all: build/app-${device}.prg

sdk:
	$(error Need to run "ln -s <sdk_dir> sdk")

developer_key.der:
	$(error Need to run "ln -s <key_file> developer_key.der")

build:
	mkdir -p $@

build/app-%.prg: build fonts icons \
		monkey.jungle sdk developer_key.der \
		$(shell find source) $(shell find resources)
	sdk/bin/monkeyc --jungles monkey.jungle --output "$@" --private-key developer_key.der --device $* --warn

release:
	mkdir -p $@

release/app.iq: release fonts icons \
		monkey.jungle sdk developer_key.der \
		$(shell find source) $(shell find resources)
	sdk/bin/monkeyc --jungles monkey.jungle --output "$@" --private-key developer_key.der --release --package-app --warn

release/app-%.prg: release fonts icons \
		monkey.jungle sdk developer_key.der \
		$(shell find source) $(shell find resources)
	sdk/bin/monkeyc --jungles monkey.jungle --output "$@" --private-key developer_key.der --device $* --warn --release

.PHONY: clean
clean:
	rm -rf build release

.PHONY: run
run: build/app-${device}.prg
	./run.sh "$<" ${device}

.PHONY: fonts
fonts: resources/fonts/dice_font_48.png \
	resources/fonts/dice_font_72.png \
	resources/fonts/dice_font_128.png

.PRECIOUS: resources/fonts/dice_font_%.png
resources/fonts/dice_font_%.png: support/dice_font.tar support/make_font.py
	python support/make_font.py -t support/dice_font.tar -o resources/fonts $*

support/dice_font.tar: support/dice_font.svg
	$(error Use inkscape to open support/dice_font.svg and save as .tar)

.PHONY: icons
icons: resources/drawables/launcher_icon.png

resources/drawables/launcher_icon.png: support/launcher_icon.svg
	inkscape --export-filename="$@" -w 30 -h 30 "$<"
