# This is only here for FMake to kinda understand what's going on with indents.
# It just substitutes FMake's _indent command for nothing. Yet it is necessary.
define(`_indent', `')

# Conditionals (if-elseif-else, paired with endif)
define(`_if',
`if [ $1 ]; then')
define(`_elseif',
`elif [ $1 ]; then')
define(`_else', `else')
define(`_endif', `fi')

# Variable setting and other higher level functions
define(`_set', `$1=$2')
define(`_println', `echo $1')
define(`_cmd', `$1')

# Build commands (the core of FMake, after all lol :3)
define(`_gcc_build',
`gcc -o $2 $1')
define(`_go_build',
`go build -o $2 $1')
define(`_rust_build',
`rustc -o $2 $1')
define(`_gpp_build',
`g++ -o $2 $1')
define(`_csc_build',
`csc /out:$2 $1')
