Conda recipes to create packages for PyGMO.

See http://esa.github.io/pygmo/index.html

----

The build order to follow is this:

* `conda build cmake`       (only on Windows)
* `conda build boost`
* `conda build pygmo`
