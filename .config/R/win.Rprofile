# symlink to ~/.Rprofile

if (interactive()) {
    local({
        r = getOption("repos")
        r["CRAN"] = "https://cloud.r-project.org/"
        options(
            repos = r,
            continue = " ",
            radian.tab_size           = 2,
            radian.color_scheme       = "monokai",
            radian.editing_mode       = "vi",
            radian.auto_match         = TRUE,
            radian.insert_new_line    = TRUE,
            radian.prompt             = "\033[0;34m>\033[0m ",
            radian.shell_prompt       = "\033[0;31m#!>\033[0m ",
            radian.browse_prompt      = "\033[0;33mBrowse[{}]>\033[0m "
        )
    })
}
