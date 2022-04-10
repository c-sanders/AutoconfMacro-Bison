# -----------------------------------------------------------------------------
# Macro : AX_BISON
# ================
#
# This macro can be used to tell the GNU Autotools where the GNU Bison package
# has been installed.
# -----------------------------------------------------------------------------


AC_DEFUN(

  [AX_BISON],

  [
	AC_ARG_WITH(
	  [bison],
	  [
AS_HELP_STRING(
[--with-bison=@<:@yes|no|path_to_bison@:>@],
[Have the build process either; i) use the first instance of bison which is found within the user's PATH (ARG=yes), ii) not use an instance of bison at all (ARG=no), or iii) use the instance of bison which resides at a specific loction (ARG=path_to_bison)]
)
	  ],
	  [BISON=${withval}],
	  [BISON=""]
	)
	AS_CASE(
	  [${withval}],
	  [yes], [AC_CHECK_PROG([BISON], [bison], [bison], [""])],
	  [no],  [BISON=""],
	  [BISON="${withval}"]
	)
	AC_SUBST(BISON)
  ]
)