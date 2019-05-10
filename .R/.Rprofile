#invisible(utils::memory.limit(size = 32768))

local({
    if (interactive()) {
        start_up <- function () {
            # set default packages
            #
            packages = c(
                'tidyverse', 'wrapr'
            )
            options(
                defaultPackages = c(
                    getOption('defaultPackages'),
                    packages
                )
            )
        }
        start_up()
        cat(
            crayon::blue$underline('Loaded:'),
            crayon::blue$underline(
                getOption('defaultPackages')[-(1:6)]
            )
        )
        cat('\n\n')

        # set options
        #
        rp <- getOption('repos')
        rp['CRAN'] <- 'https://cloud.r-project.org/'
        options(
            # global
            repos    = rp,
            prompt   = '-> ',
            continue = ' ',

            # radian prompt
            radian.color_scheme       = "native",
            radian.editing_mode       = "vi",
            radian.auto_match         = TRUE,
            radian.completion_timeout = 0.0,
            radian.insert_new_line    = TRUE,
            radian.prompt             = "\033[0;34mr$>\033[0m ",
            radian.shell_prompt       = "\033[0;31m#!>\033[0m ",
            radian.browse_prompt      = "\033[0;33mBrowse[{}]>\033[0m "
        )
    }
})


