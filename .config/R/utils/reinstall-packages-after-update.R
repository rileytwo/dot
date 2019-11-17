lib_loc <- '/library/frameworks/r.framework/versions/3.5/resources/library'
to_install <- unname(installed.packages(lib.loc = lib_loc)[, "Package"])

to_install

install.packages(to_install)
