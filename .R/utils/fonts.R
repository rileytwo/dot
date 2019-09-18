#
# fonts.R
# 2019-05-20 06:56:51
# install packages required for using additional fonts in R
#

local({
    get_fonts <- function() {
        if (!require(extrafontdb)) {
            install.packages('extrafont')

            if (!require(extrafont)) {
                install.packages('extrafontdb')

            } else {
                extrafont::font_import()

            }
        } else {
            extrafont::font_import()
        }
    }

    get_fonts()
})
