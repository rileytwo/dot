#invisible(utils::memory.limit(size = 32768))

if (interactive()) {
    # local({
    #     start_up <- function () {
    #         # set default packages
    #         #
    #         packages = c(
    #             'tidyverse', 'wrapr'
    #         )
    #         options(
    #             defaultPackages = c(
    #                 getOption('defaultPackages'),
    #                 packages
    #             )
    #         )
    #     }
    #     start_up()
    #     cat(
    #         crayon::blue$underline('Loaded:'),
    #         crayon::blue$underline(
    #             getOption('defaultPackages')[-(1:6)]
    #         )
    #     )
    #     cat('\n\n')
    # })
    suppressMessages(require(devtools))
    suppressMessages(require(usethis))
    options(
        # dev
        #
        usethis.full_name = "Riley Roach",
        usethis.description = list(
            `Authors@R` = paste0(
                'person("Riley", "Roach", ',
                'email = "reachroach25@icloud.com", ',
                'role = c("aut", "cre"), ',
                'comment = c(ORCID = "YOUR-ORCID-ID"))'
            )
            #License = "MIT + file LICENSE",
            #Version = "0.0.0.9000"
        ),
        usethis.protocol  = "https",
        # global
        #
        #repos    = 'https://cloud.r-project.org',
        prompt   = ">>> ",
        continue = " ",
        # radian prompt
        #
        radian.color_scheme       = "native",
        radian.editing_mode       = "vi",
        radian.auto_match         = TRUE,
        radian.completion_timeout = 0.0,
        radian.insert_new_line    = TRUE,
        radian.prompt             = "\033[0;34m>>>\033[0m ",
        radian.shell_prompt       = "\033[0;31m#!>\033[0m ",
        radian.browse_prompt      = "\033[0;33mBrowse[{}]>\033[0m "
    )
}


