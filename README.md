Filename : README.md


### 1) Introduction

GNU Autoconf macro for detecting if the GNU Bison package is installed on a system.

This package is centred around the following file;

```
ax_bison_rootdir.m4
```

This file implements a GNU Autoconf macro which is called ```AX_BISON_ROOTDIR``` and this macro
can be used by the GNU Autoconf utility to determine where the GNU Bison package has been installed
on a particular system.

In order to use this macro, the ```configure.ac``` file of any GNU Autotools package, must invoke
it as follows;

```
AX_BISON_ROOTDIR()
```

Hello.

If this macro is able to be successfully included into a GNU Autotools project, then it should
appear as follows when the resulting configure script is invoked;

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
12 [AX_BISON],
13
14 [
15 AC_ARG_WITH(
16 [bison],
17 [
18 AS_HELP_STRING(
19 [--with-bison=@<:@yes|no|path_to_bison@:>@],
20 [Have the build process either; i) use the first instance of bison which is found within the user's PATH (ARG=yes), ii) not use an instance of bison at all (ARG=no), or iii) use the instance of bison which resides at a specific loction (ARG=path_to_bison)]
21 )
22 ],
23 [BISON=${withval}],
24 [BISON=""]
25 )
26 AS_CASE(
27 [${withval}],
28 [yes], [AC_CHECK_PROG([BISON], [bison], [bison], [""])],
29 [no],  [BISON=""],
30 [BISON="${withval}"]
31 )
32 AC_SUBST(BISON)
33 ]
34)
```