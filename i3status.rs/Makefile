all:
	cargo build --release
	strip --remove-section=.{note,comment} target/release/i3status-rs
	ln -f target/release/i3status-rs ~/bin 2>/dev/null || mv target/release/i3status-rs ~/bin

clean:
	cargo clean
	rm Cargo.lock
