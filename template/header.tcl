#!/usr/bin/env bash
# \
exec /arm/tools/setup/bin/mrun +swdev +tct/tcl/8.6.1 tclsh $0 "$@"
#!/usr/bin/env tclsh
puts $tcl_version

