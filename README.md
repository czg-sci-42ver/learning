- [see vscode R official for more `vscode-R` fantastic features](#see-vscode-r-official-for-more-vscode-r-fantastic-features)
- [renv may not behave like python virtualenv to activate any where](#renv-may-not-behave-like-python-virtualenv-to-activate-any-where)
- [init see automatic_command/init_ubuntu/R_code/ in automatic command repository](#init-see-automatic_commandinit_ubuntur_code-in-automatic-command-repository)
- [.lintr](#lintr)
  - [recommended example (nicer than the lintr github official example)](#recommended-example-nicer-than-the-lintr-github-official-example)
  - [recommended tutorial](#recommended-tutorial)
  - [environment](#environment)
- [~/.Rprofile](#rprofile)
  - [packages used inside **must be installed appropriately** because it may not emit errors if it not installed](#packages-used-inside-must-be-installed-appropriately-because-it-may-not-emit-errors-if-it-not-installed)
    - [so vscode may **crash** but R console doesn‘t](#so-vscode-may-crash-but-r-console-doesnt)
  - [R **history** saving has a lot of problems](#r-history-saving-has-a-lot-of-problems)
  - [**Rstudio** may be not able to run parallelly with vscode](#rstudio-may-be-not-able-to-run-parallelly-with-vscode)
  - [you may must place a `globalenv.json` to vmake`.vscode-R/globalenv.json` to avoid error `vscode-R/globalenv.json': No such file or directory`](#you-may-must-place-a-globalenvjson-to-vmakevscode-rglobalenvjson-to-avoid-error-vscode-rglobalenvjson-no-such-file-or-directory)
  - [must use interactive R to enable workspace](#must-use-interactive-r-to-enable-workspace)
- [Rmarkdown](#rmarkdown)
  - [the `./issue.md` also helps](#the-issuemd-also-helps)
  - [use `knitr::knit_engines$set(python` to enable python venv](#use-knitrknit_enginessetpython-to-enable-python-venv)
- [debug](#debug)
  - [`settings.json`](#settingsjson)
# see [vscode R official](https://github.com/REditorSupport/vscode-R/wiki/R-Language-Service) for more `vscode-R` fantastic features

# renv may not behave like python virtualenv to activate any where

# init see [automatic_command/init_ubuntu/R_code/ in automatic command repository]()
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
> > just `vscode-R` extension is enough by seeing [github README](https://github.com/REditorSupport/vscode-R)

> don‘t use `R tools ` extension which conflicts with `vscode-R`
> > which may need disable and then enable `vscode-R` vto enable `Rmarkdown support`.
> 

> don‘t add too many extensions


> use the correct **language mode** to enable Rmarkdown **features**
> > notice the **status bar**changes
> 
> also can be configured in the `settings.json`
>  ```json
>     "files.associations": {
>        "*.json": "jsonc",
>        "*.rmd": "markdown",
>        "*.Rmd": "rmd"
>    },
>  ``` 

## the `./issue.md` also helps

## use `knitr::knit_engines$set(python` to enable python venv
https://bookdown.org/yihui/rmarkdown-cookbook/custom-engine.html
# debug
## `settings.json`
> see from **vscode-R plugin** github wiki 
```json
"r.alwaysUseActiveTerminal": true,
```
run in the terminal
```bash
tmux # vscode
r # alias of radian in the bashrc

######## another terminal
tmux attach-session -t 0 # size determined by the smaller one
```