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
> really important to enable **workspace** show results not using vscode command `R: create new terminal` 
> > [.Rprofile source init.R in the vscode-R dir](https://github.com/REditorSupport/vscode-R/issues/355)
> > 
> > so we can use **tmux** to attach Session
> >
> > > which also solve the `globalenv` problem
> > > 
> > > ```json
> > > "allowGlobalDebugging": true,
> > > ```
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
## packages used inside **must be installed appropriately** because it may not emit errors if it not installed
### so vscode may **crash** but R console doesn‘t
## R **history** saving has a lot of problems
- in radian `Error in .External2(C_savehistory, file) : no history available to save`
- in R `Warning message:
problem in saving the history file '~/.Rhistory' `

## **Rstudio** may be not able to run parallelly with vscode

## you may must place a `globalenv.json` to vmake`.vscode-R/globalenv.json` to avoid error `vscode-R/globalenv.json': No such file or directory`
- otherwise the **vscode-R plugins** may not work

## must use interactive R to enable workspace
["R: Create R terminal"](https://github.com/REditorSupport/vscode-R/issues/879)

# Rmarkdown
> may be need to run `rmarkdown::run("~/R_code/sampling/markov.Rmd")` twice