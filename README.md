Shelves CSS Grid
================

**The only responsive, fluid CSS grid with infinitely nestable columns.**

[See the Demo](http://shelves.petebrowne.com/)

TODO: Add longer description & Feature list.

Installation
------------

### For CSS Users

Download the latest distribution of [the CSS file](https://raw.github.com/petebrowne/shelves/master/css/shelves.css) and go to town.

### For Sass Users (Compass & Rails)

Add the shelves gem to your Gemfile and import it:

``` ruby
# ...
gem 'shelves'
# ...
```

``` scss
// @import "shelves";   // Import just the mixins
@import "shelves-grid"; // Import mixins & default grid
```

Custom CSS Build
----------------

To customize the CSS without using Sass, you can use the command line tool:

``` bash
$ gem install shelves
$ shelves --width 1140px --columns 16 > grid.css
```

Run width `--help` to see all of the available options:

``` bash
$ shelves --help
```

Usage
-----

TODO...

Copyright
---------

Copyright (c) 2012 [Pete Browne](http://petebrowne.com). See LICENSE for details.
