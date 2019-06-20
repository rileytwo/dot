#!/usr/bin/env Rscript
#
# text-to-excel.R
# 2019-05-31 07:38:48
#
# Convert *.txt files to *.xlsx from the command line.
#


args <- commandArgs(trailingOnly = TRUE)

expected_argument <- function(args) {
    nq <- noquote
    nq("")
    nq("Expected argument to be present.")
    nq("Please specify a .txt file.")
    nq("")
    nq("Run Rscript ttx.R (-h|--help) for more information.")
}

display_usage <- function(args) {
    nq <- noquote
    nq("")
    nq("Usage:")
    nq("")
    nq(" > Rscript ttx.R \'<infile.txt>\' \'<outfile.xlsx>\' ")
}


parse_args <- function(args) {
    switch(
           args
    )
}
