# My dot-emacs directory
Works for *emacs* 2.4. Tested on Mac.

## Installation
Clone this repository to `~/.emacs.d` and run the following:

```sh
    # cd ~/.emacs.d
    # git submodule update --init
```

On first boot all required packages should be installed automatically.

## Manual requirements
Some modes require binaries to be present in the system:

* *Ack* is required by `ack-and-a-half`
* [Tern](http://ternjs.net) is required for using `tern-mode` in
  javascript.
