Filename : README.md


### 1) Introduction

The sole reason this package exists, is because it contains a file called ```ax_bison_rootdir.m4```.
This file implements a GNU Autoconf macro which can be used for specifying the location into which
the GNU Bison package has been installed on a particular system. The macro is called
```AX_BISON_ROOTDIR``` and in order for a GNU Autotools package to use it properly, it must be
invoked from within the package's ```configure.ac``` file as follows;

```
AX_BISON_ROOTDIR()
```

If the GNU Autotools are able to successfully process a project which uses this macro, then they
should generate a file which is called ```configure```. This file is referred to as the
configure script for the project which it was generated for, and if the ```AX_BISON_ROOTDIR``` macro
was able to be successfully incorporated into this configure script by the GNU Autotools, then the
following configure script option should be available when this configure script is invoked with
the ```--help``` option;

```
--with-bison-rootdir=[yes|no|path_to_bison_rootdir]
                        instruct the build process to perform one - and only
                        one, of the following three options; 1) use the
                        first instance of bison which is found within the
                        user's PATH (ARG=yes), 2) not use an instance of
                        bison at all (ARG=no), or 3) use the instance of
                        bison which resides at a specific loction
                        (ARG=path_to_bison)
```


### 2) About the macro

The macro is implemented in a rather basic fashion. It does not do anything too complex, and most of
the work is offloaded onto the GNU Autoconf macro ```AC_CHECK_PROG```.


### 3) Implementation of the macro

As at 12 April 2022, the macro was implemented as follows;

```
01 # -----------------------------------------------------------------------------
02 # Macro : AX_BISON
03 # ================
04 #
05 # This macro can be used to tell the GNU Autotools where the GNU Bison package
06 # has been installed.
07 # -----------------------------------------------------------------------------
08
09
10 AC_DEFUN(
11 
12   [AX_BISON],
13
14   [
15     AC_ARG_WITH(
16       [bison],
17       [
18         AS_HELP_STRING(
19           [--with-bison=@<:@yes|no|path_to_bison@:>@],
20           [Have the build process either; i) use the first instance of bison which is found within the user's PATH (ARG=yes), ii) not use an instance of bison at all (ARG=no), or iii) use the instance of bison which resides at a specific loction (ARG=path_to_bison)]
21         )
22       ],
23       [BISON=${withval}],
24       [BISON=""]
25     )
26     AS_CASE(
27       [${withval}],
28       [yes], [AC_CHECK_PROG([BISON], [bison], [bison], [""])],
29       [no],  [BISON=""],
30       [BISON="${withval}"]
31     )
32     AC_SUBST(BISON)
33   ]
34)
```