# My dot-emacs directory
Works for *emacs* 2.4. Tested on Mac and linux (Fedora).

## Installation
You can use [Carton][] to pre-install required packages. See the
Carton readme file for details (you must have *emacs* and *git*
already installed):

Clone this repository to `~/.emacs.d` and run the following:

```sh
    # cd ~/.emacs.d
    # git submodule update --init
    # cd /tmp
    # cd carton && git checkout -q v0.3.1
    # git clone git://github.com/rejeep/carton.git
    # cd ~/.emacs
    # /tmp/carton/bin/carton install
```

This should install all required packages. You can delete the *carton*
repository and start using emacs.

(Alternatively launch emacs and install the required packages manually -
at least until all errors resolves).
