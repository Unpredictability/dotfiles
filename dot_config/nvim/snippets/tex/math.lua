require("user.tex_utils")
return {
	s("hi", { t("in math passed") }, { cond = TEX_UTILS.in_mathzone }),
}
