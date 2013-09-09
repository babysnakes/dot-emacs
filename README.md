# My dot-emacs directory
Works for *emacs* 2.4. Tested on Mac and linux (Fedora).

## Installation
Clone this repository to `~/.emacs.d` and run the following:

```sh
    # cd ~/.emacs.d
    # git submodule update --init
    # cd vendor/js3-mode
    # bin/build
```

> The *js3-mode* build is only required if you're going to use it (it
> byte compiles for faster load time).

On first boot all required packages should be installed automatically.
