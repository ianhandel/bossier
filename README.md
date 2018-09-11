# bossier
[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![Travis build status](https://travis-ci.org/ianhandel/bossier.svg?branch=master)](https://travis-ci.org/ianhandel/bossier)
[![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/ianhandel/bossier?branch=master&svg=true)](https://ci.appveyor.com/project/ianhandel/bossier)


A lightweight package to import data from [Bristol] Online Surveys

Uses the sjlabelled package

Currently just provides the read_bos() function which imports a .sav file saved from Online Surveys (formelry BOS).

To test install with...

devtools::install_github("ianhandel/bossier")

Then look at help on read_bos() with runnable example using built in .sav data
