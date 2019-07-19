#
# remove_user_installs.R
# 2019-06-14 07:28:58
#

pkgs <- as.data.frame(
    installed.packages()
)

unique(pkgs$LibPath)

pkgs_base <- subset(
    pkgs,
    Priority %in% 'base'
)

unique(pkgs_base$LibPath)

pkgs_recommended <- subset(
    pkgs,
    Priority %in% 'recommended'
)

unique(pkgs_recommended$LibPath)
