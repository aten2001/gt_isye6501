#!/usr/bin/Rscript
# vim: tw=80 ts=2 sw=2:

# Homework 8 - Variable selection

library(glmnet)

crime <- read.table(
  '../data/uscrime.txt',
  header = TRUE
)

# do foo
