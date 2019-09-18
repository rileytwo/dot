#invisible(utils::memory.limit(size = 32768))

if (interactive()) {
    # suppressMessages(require(devtools))
    # suppressMessages(require(usethis))
    #
    # options(
    #    usethis.full_name = "Riley Roach",
    #     usethis.description = list(
    #         `Authors@R` = paste0(
    #             'person("Riley", "Roach", ',
    #             'email = "reachroach25@icloud.com", ',
    #             'role = c("aut", "cre")'
    #              ),
    #         License = "MIT + file LICENSE",
    #         Version = "0.0.0.9000"
    #         ),
    #     usethis.protocol  = "https",
    #     )
    # )
    local({
        r = getOption("repos")
        r["CRAN"] = "https://cloud.r-project.org/"
        options(
            # global
            #
            repos = r,
            prompt   = ">>> ",
            continue = " ",
            # radian prompt
            #
            radian.tab_size           = 2,
            radian.color_scheme       = "native",
            radian.editing_mode       = "vi",
            radian.auto_match         = TRUE,
            radian.completion_timeout = 0.0,
            radian.insert_new_line    = TRUE,
            radian.prompt             = "\033[0;34m>>>\033[0m ",
            radian.shell_prompt       = "\033[0;31m#!>\033[0m ",
            radian.browse_prompt      = "\033[0;33mBrowse[{}]>\033[0m "
        )
    })
}
