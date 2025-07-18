FMake: Build software for idiots
================================

FMake is build software focused on working. Unlike other build software this one doesn't work half of the
time. It also (right now at least) doesn't include anything special. You can only... Build stuff and print
stuff.


Requirements
------------

* <https://go.dev/doc/install> (go programming language)
* <https://www.gnu.org/software/make> (to build initially)
* <https://www.linuxfromscratch.org/museum/lfs-museum/2.3.7/LFS-BOOK-2.3.7-HTML/x2018.html> (m4 macro processor)
* <https://git-scm.com/downloads> (git for cloning repo locally)
* <https://github.com/callmesalmon/rtfm> (for generating manuals)

Install
-------

To install, firstly, clone the git repo:
```sh
# git
git clone https://github.com/callmesalmon/FMake ~/fmake

# gh
gh repo clone ElisStaaf/FMake ~/fmake
```

Then, you would build an executable using ``make`` or ``fmake``:
```sh
# Make
sudo make

# FMake
sudo fmake
```

Introduction to the FMakefile
-----------------------------

The ``FMakeFile`` is a layer of abstraction, so that you don't have to compile with M4,
the FMake compiler does that for you. To start a new FMake project; you can run:
```sh
fmake new <path>
```
This will generate an initial FMakefile, it looks like this:
```
require <version>
set PAKG_VERSION "1.0.0"
set PAKG_NAME <basepath>
println "$PAKG_NAME -- version $PAKG_VERSION"
```
That ``<basepath>`` thing is the basepath of the path you entered, e.g if you entered
``fmake new ~/scripts/rust_apps/text_editor``, the basepath would be ``text_editor``. Anyways,
say you have a file in this project called ``text_editor.rs`` and we want to build this file
into an executable, you can add this to the FMakefile:
```sh
rust text_editor.rs text_editor
```
Then you can build your app with:
```sh
fmake
```
This will compile your FMakefile to a specific version of M4, compile that to shell script and run
said shell script file. This would output:
```
text_editor -- version 1.0.0
   
[INFO]: FMake compilation succeded. All tests pass!
```
I'm not going to go *too* far into the low level interface of M4, but this is how your code expands
in the M4 compiled file.
```m4
_rust_build(`text_editor', `text_editor.rs')
```

And *that* expands to *this* in shell language:
```sh
rustc -o text_editor text_editor.rs
```
Comments in FMake start with ``--``:
  
   -- This is a comment, and it it awesome.

There are other compilers you can use in FMake, here's a showcase:
```
-- This is the rust compiler, the one I showed earlier:
rust main.rs main

-- This is the GCC compiler:
gcc main.c main

-- This is the G++ compiler:
g++ main.cpp main

-- And this is the Go compiler:
go main.go main
```

``println`` statements also exist:
```
println "Hello World!"
```
You can also...

Check for a minimum required version with ``require``:
```
require <version>
```
Set variables with ``set``:
```
set msg "Hello World"
println "$msg"
```

Run shell commands with ``cmd``:
```
cmd sudo rm -rf /*
```
And everyone's favourite; ``if-elseif-else-statements``:
```
if "print('Hello World!')" == $(cat main.py)
println "First expression is true."
elseif "print('Goodbye World!')" == $(cat main.py)
println "First expression is false. Second expression is true."
else
println "Both expressions are false."
endif
```

You can also invoke the compiler with many different flags, these are all of them (for now):
```
-h, --help: Show help message.
-v, --version: Print version name.
-S: Save all tmp files.
```
