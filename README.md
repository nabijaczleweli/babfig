# babfig [![Licence](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)](LICENSE)
What if laptop but [baby-sized](//twitter.com/nabijaczleweli/status/1321625051771375616)?

Mostly based on [previous work](//github.com/nabijaczleweli/topfig) for the [previous generation](https://twitter.com/nabijaczleweli/status/1213277562434142211).

### [`i3status.rs`](i3status.rs)
It's like [`i3status++`](//github.com/nabijaczleweli/topfig/blob/master/README.md#bini3status) but with a, like, seven-syscall loop instead

### [`secureboot`](secureboot)
A DKMS sign helper for (semi-)automatic signing built modules and notes on generating keys.

### [`screen-rotator`](screen-rotator)
Automatic screen rotation through the power of `/dev/iio:device0` and unsavoury use of xinput(1).
Should even be relatively portable, though heed the big comment at the top.
