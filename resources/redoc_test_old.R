# Test the redoc package which handles comments/revisions in MS Word
# redoc is an experimental package to enable a two-way R-Markdown ⟷ Microsoft Word workflow
# redoc provides an R Markdown output format of rdocx_reversible(), built on top
# of rmarkdown::word_document(). You will typically call it via the YAML header
# in your R Markdown document. You have the option of highlighting the outputs
# (both chunk and inline) in the Word Document.

library(tidyverse)
# source("https://install-github.me/noamross/redoc") # To install

library(redoc)
# undoc(redoc_example_docx()) # creates skeleton.Rmd
redoc_extract_rmd(redoc_example_docx()) # creates skeleton.original.Rmd

# Open skeleton.original.Rmd and knit to docx
# Add some comments or make tracked changes
# Save the file as skeleton.original2.docx, then run
undoc("skeleton.original2.docx")
# This produces skeleton.original2.Rmd which will have the comments and tracked
# changes included in the Rmd file
# If you knit from this new Rmd file, it will produce the docx file pretty much
# as it was. The only exception is that the name of the person making comments
# will be in the comments, enclosed in brackets.


# knit 'redoc_test.Rmd' to produce a redoc
# Make some tracked changes/comments - see 'redoc_test2.docx'

undoc("redoc_test2.docx", "redoc_test2_criticmarkup.Rmd", 
      track_changes = "criticmarkup")

undoc("redoc_test2.docx", "redoc_test2_accept.Rmd", 
      track_changes = "accept")

undoc("redoc_test2.docx", "redoc_test2_reject.Rmd", 
      track_changes = "reject")

undoc("redoc_test2.docx", "redoc_test2_all.Rmd", 
      track_changes = "all")

# Only the criticmarkup Rmd file can be knitted again
