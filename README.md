## My dot-emacs directory

Works for *emacs* 2.4. Tested on Mac. This is my new setup using
`use-package` and only one `.el` file.

### Installation

Clone this repository to `~/.emacs.d` or just copy the init.el file
into your `.emacs.d` directory (if you don't care about keeping
up-to-date or some extra files - snippets, etc).

### Usage

On first boot all mandatory packages should be installed
automatically. However, take a look at `init.el` file (the various
`use-package` invocations), most of the package are not mandatory and
should be installed manually if required.

## Manual requirements
Some modes require binaries to be present in the system:

* *the_silver_searcher (ag)* is required by `ag`
* [Tern](http://ternjs.net) is required for using `tern-mode` in
  javascript.
* *js-beautify* is required by `web-beautify`.
* Maybe more ...
