
device?=vivoactive4s

.PHONY: all
all: app.prg

sdk:
	echo "ln -s <sdk_dir> sdk"

developer_key.der:
	echo "ln -s <key_file> developer_key.der"

app.prg: monkey.jungle sdk developer_key.der $(shell find source) $(shell find resources)
	sdk/bin/monkeyc --jungles monkey.jungle --output "$@" --private-key developer_key.der --device ${device} --warn

.PHONY: clean
clean:
	rm app.prg
