---
title: "Wishlist"
author: "Jill MacKay"
date: "13 April 2018"
output: 
  html_document:
    keep_md: true
---

# What Do We Want?
* Data exported in tidy principles
* Scale/rank questions collapsed into tidy-principled data
* Informative headings (alt question text)
* Data to be of the right class!


# Test Data
Created a survey which has all question types (as of 13/04/18), routing, alt question text, and at least one section heading. This should cover all forms of bos export.

Survey: [https://edinburgh.onlinesurveys.ac.uk/bossier](https://edinburgh.onlinesurveys.ac.uk/bossier)

Export names always take the form of results-for-[survey title]-[year]-[month]-[day]-[time].[extension]

## BoS Export Options
There are a range of export options for BoS which can be confusing. If you're using Minitab you will *have* to combine two or more exports because Minitab does not understand ordinal data very well, and most surveys have ordinal data in my opinion. 

The options I have **bolded** are the options I would select if I was exporting data personally. This is what we want our package to do.

> ### Customise Your Report
> * **Include unique response number for each respondent**
> * Include date of response submission
> * Include date and time of response submission
> * Include section headings
> * Exclude free text responses
> * **Use alternative question text (if provided)**


> ### Options for coded exports
> * code responses (for import into statistical software) *Note that all SPSS files are coded automatically*
>   + Zero index all multiple choice, multiple answer, selection list and scale questions
>   + Reverse index values for all multiple choice, multiple answer, selection list and scale questions
>   + **Combine scale/rank values into a single column where possible**

# Sample data
## Basic data, no custom import
* Tab Separated Values File - results-for-bossier-2018-04-13-1527.tsv
* SPSS File - results-for-bossier-2018-04-13-1527.sav
* Excel (2003 and older) file - results-for-bossier-2018-04-13-1527.xls
* Excel (2007 and later) file - results-for-bossier-2018-04-13-1526.xlsx
* Comma Separated Values File - results-for-bossier-2018-04-13-1527.csv

## Customised Export Data
* Options selected:
  + Include unique response number for each respondent
  + Use alternative question text if provided
  + Code responses for import into statistical software
  + Combine scale/rank values into a single column where possible

The files:

* Tab Separated Values File - results-for-bossier-2018-04-13-1540.tsv
  + Plus key file (separate export) - results-for-bossier-2018-04-13-1541-key.tsv
* SPSS File - results-for-bossier-2018-04-13-1539.sav
* Excel (2003 and older) file - results-for-bossier-2018-04-13-1539.xls
  + Plus key file (separate export) - results-for-bossier-2018-04-13-1542-key.xls
* Excel (2007 and later) file - results-for-bossier-2018-04-13-1539.xlsx
  + Plus key file (separate export) - results-for-bossier-2018-04-13-1542-key.xlsx
* Comma Separated Values File - results-for-bossier-2018-04-13-1539.csv
  + Plus key file (separate export) - results-for-bossier-2018-04-13-1541-key.csv

**Note that SAV files don't have correpsonding key files (I guess it's the meta data)**






## Play data

```r
# Basic imports
bd.excel <- readxl::read_excel("TestData/results-for-bossier-2018-04-13-1526.xlsx")
bd.csv <- read.csv("TestData/results-for-bossier-2018-04-13-1527.csv")
bd.spss <- haven::read_sav("TestData/results-for-bossier-2018-04-13-1527.sav")

#Custom Data
cd.excel <- readxl::read_excel("TestData/results-for-bossier-2018-04-13-1539.xlsx")
cd.csv <- read.csv("TestData/results-for-bossier-2018-04-13-1539.csv")
cd.spss <- haven::read_sav("TestData/results-for-bossier-2018-04-13-1539.sav")

# One of my irritations. You need to convert everything away from character class
lapply(bd.excel, class)
```

```
## $`1. You consent to generate data for the development of the bossieR package (https://github.com/ianhandel/bossier)`
## [1] "character"
## 
## $`2. Favourite pet (multiple choice single answer)`
## [1] "character"
## 
## $`3. All pets you like (multiple answer)`
## [1] "character"
## 
## $`4. Favourite crisps (select list question)`
## [1] "character"
## 
## $`5. Age (single line text with restrictions)`
## [1] "character"
## 
## $`6. Give us a story (freetext)`
## [1] "character"
## 
## $`7. Routing test`
## [1] "character"
## 
## $`8. Route A question`
## [1] "character"
## 
## $`9. Route B Question`
## [1] "character"
## 
## $`10. Significant date in your life (date)`
## [1] "character"
## 
## $`11. What time is it? (time)`
## [1] "character"
## 
## $`12. When do you think the world will end (date and time question)`
## [1] "character"
## 
## $`13. Rank the power rangers (ranked)`
## [1] "logical"
## 
## $`13.1. Red`
## [1] "character"
## 
## $`13.2. Green`
## [1] "character"
## 
## $`13.3. White`
## [1] "character"
## 
## $`13.4. Pink`
## [1] "character"
## 
## $`13.5. Yellow`
## [1] "character"
## 
## $`13.6. Blue`
## [1] "character"
## 
## $`13.7. Black`
## [1] "character"
## 
## $`14. How likely are you to . . .`
## [1] "logical"
## 
## $`14.1.a. Write an R Package`
## [1] "character"
## 
## $`14.2.a. Use Excel to Annoy Ian`
## [1] "character"
## 
## $`14.3.a. Give over to the glory of communism`
## [1] "character"
## 
## $`15. What route did you choose?`
## [1] "character"
```
