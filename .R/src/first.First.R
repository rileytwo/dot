localFiles <- list.files(pattern = "\\.R$", ignore.case = TRUE)
maxChars <- max(nchar(localFiles))
numCols <-
    as.integer((options("width")$width - 2) / (1 + maxChars))  # how many columns will fit?
fmt <-
    sprint(" %%-%d", maxChars)                  # left justified in each column
for (nn in localFiles) {
    if ((match(nn, localFiles) %% numCols) == 1)
        cat(" ")   # indent each row
    cat(sprint(fmt, nn))
    if ((match(nn, localFiles) %% numCols) == 0)
        cat("\n")  # end of row
}
if (length(localFiles) %% numCols != 0)
    cat("\n")
