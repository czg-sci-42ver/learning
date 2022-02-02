# .lintr
- put in ～ or workspace
- don't exists unvalid configs （e.g. empty `.lintr`）
- `lintr.R` `test.R` may be no use
## recommended example (nicer than the lintr github official example)
[languageserver](https://github.com/REditorSupport/languageserver/blob/master/.lintr)
## recommended tutorial
[renkun](https://renkun.me/2019/12/11/writing-r-in-vscode-a-fresh-start/)
[cran official document collection](https://www.r-project.org/other-docs.html)
## environment
[Reproducible](https://environments.rstudio.com)

# ~/.Rprofile
```bash
\cp ~/.Rprofile ~/automatic_command/init_ubuntu/R_code/config/
```
- [tutorial](https://cran.r-project.org/web/packages/startup/vignettes/startup-intro.html) also with R initial environment variable config
- [GITHUB_PAT,etc in Renviron](https://rstats.wtf/r-startup.html)
- please read carefully the comments of the `.Rprofile` to avoid the following problems like **no lintcache**
  - **Error: callr subprocess failed: cannot open the connection**
  - **Failed to run diagnostics: callr subprocess failed: cannot open the connection**
  - **cannot open file 'vscode-R/globalenv.json': No such file or directory**
  - **cannot open the connectionwarning messages from top-level task callback 'vsc.globalenv'**
  - Failed to run diagnostics: callr subprocess failed: Malformed config file, ensure it ends in a newline   missing value where TRUE/FALSE needed
    - not use `true` or `false` casually
    - not necessary to have newline at the end of the file