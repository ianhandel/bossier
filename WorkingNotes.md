---
title: "Wishlist"
author: "Jill MacKay"
date: "13 April 2018"
output: 
  html_document:
    keep_md: true
---

# What Do We Want?
* Tidy verse exports
* Scale/rank questions collapsed into data
* Informative headings (alt question text)
* Data to be of the right class!


# Test Data
Created a survey which has all question types (as of 13/04/18), routing, alt question text, and at least one section heading. This should cover all forms of bos export.

Survey: [https://edinburgh.onlinesurveys.ac.uk/bossier](https://edinburgh.onlinesurveys.ac.uk/bossier)

Export names always take the form of results-for-[survey title]-[year]-[month]-[day]-[time].[extension]

## Play data

```r
# bd is basic export with no customised options
bd <- haven::read_sav("TestData/results-for-bossier-2018-04-13-1152.sav") 

# cd is customised data - unique response numbers, alt question text, scale/rank data combined
cd <- haven::read_sav("TestData/results-for-bossier-2018-04-13-1259.sav")

lapply(bd,class)
```

```
## $Q1
## [1] "labelled"
## 
## $Q2
## [1] "labelled"
## 
## $Q3_1
## [1] "labelled"
## 
## $Q3_2
## [1] "labelled"
## 
## $Q3_3
## [1] "labelled"
## 
## $Q3_4
## [1] "labelled"
## 
## $Q3_5
## [1] "labelled"
## 
## $Q4
## [1] "labelled"
## 
## $Q5
## [1] "character"
## 
## $Q6
## [1] "character"
## 
## $Q7
## [1] "labelled"
## 
## $Q8
## [1] "labelled"
## 
## $Q9
## [1] "labelled"
## 
## $Q10
## [1] "Date"
## 
## $Q11
## [1] "hms"      "difftime"
## 
## $Q12
## [1] "POSIXct" "POSIXt" 
## 
## $Q13_1_1
## [1] "labelled"
## 
## $Q13_1_2
## [1] "labelled"
## 
## $Q13_1_3
## [1] "labelled"
## 
## $Q13_1_4
## [1] "labelled"
## 
## $Q13_1_5
## [1] "labelled"
## 
## $Q13_1_6
## [1] "labelled"
## 
## $Q13_1_7
## [1] "labelled"
## 
## $Q13_2_1
## [1] "labelled"
## 
## $Q13_2_2
## [1] "labelled"
## 
## $Q13_2_3
## [1] "labelled"
## 
## $Q13_2_4
## [1] "labelled"
## 
## $Q13_2_5
## [1] "labelled"
## 
## $Q13_2_6
## [1] "labelled"
## 
## $Q13_2_7
## [1] "labelled"
## 
## $Q13_3_1
## [1] "labelled"
## 
## $Q13_3_2
## [1] "labelled"
## 
## $Q13_3_3
## [1] "labelled"
## 
## $Q13_3_4
## [1] "labelled"
## 
## $Q13_3_5
## [1] "labelled"
## 
## $Q13_3_6
## [1] "labelled"
## 
## $Q13_3_7
## [1] "labelled"
## 
## $Q13_4_1
## [1] "labelled"
## 
## $Q13_4_2
## [1] "labelled"
## 
## $Q13_4_3
## [1] "labelled"
## 
## $Q13_4_4
## [1] "labelled"
## 
## $Q13_4_5
## [1] "labelled"
## 
## $Q13_4_6
## [1] "labelled"
## 
## $Q13_4_7
## [1] "labelled"
## 
## $Q13_5_1
## [1] "labelled"
## 
## $Q13_5_2
## [1] "labelled"
## 
## $Q13_5_3
## [1] "labelled"
## 
## $Q13_5_4
## [1] "labelled"
## 
## $Q13_5_5
## [1] "labelled"
## 
## $Q13_5_6
## [1] "labelled"
## 
## $Q13_5_7
## [1] "labelled"
## 
## $Q13_6_1
## [1] "labelled"
## 
## $Q13_6_2
## [1] "labelled"
## 
## $Q13_6_3
## [1] "labelled"
## 
## $Q13_6_4
## [1] "labelled"
## 
## $Q13_6_5
## [1] "labelled"
## 
## $Q13_6_6
## [1] "labelled"
## 
## $Q13_6_7
## [1] "labelled"
## 
## $Q13_7_1
## [1] "labelled"
## 
## $Q13_7_2
## [1] "labelled"
## 
## $Q13_7_3
## [1] "labelled"
## 
## $Q13_7_4
## [1] "labelled"
## 
## $Q13_7_5
## [1] "labelled"
## 
## $Q13_7_6
## [1] "labelled"
## 
## $Q13_7_7
## [1] "labelled"
## 
## $Q14_1_a
## [1] "labelled"
## 
## $Q14_2_a
## [1] "labelled"
## 
## $Q14_3_a
## [1] "labelled"
## 
## $Q15
## [1] "labelled"
```

```r
lapply(cd,class)
```

```
## $URN
## [1] "character"
## 
## $Q1
## [1] "labelled"
## 
## $Q2
## [1] "labelled"
## 
## $Q3_1
## [1] "labelled"
## 
## $Q3_2
## [1] "labelled"
## 
## $Q3_3
## [1] "labelled"
## 
## $Q3_4
## [1] "labelled"
## 
## $Q3_5
## [1] "labelled"
## 
## $Q4
## [1] "labelled"
## 
## $Q5
## [1] "character"
## 
## $Q6
## [1] "character"
## 
## $Q7
## [1] "labelled"
## 
## $Q8
## [1] "labelled"
## 
## $Q9
## [1] "labelled"
## 
## $Q10
## [1] "Date"
## 
## $Q11
## [1] "hms"      "difftime"
## 
## $Q12
## [1] "POSIXct" "POSIXt" 
## 
## $Q13_1
## [1] "labelled"
## 
## $Q13_2
## [1] "labelled"
## 
## $Q13_3
## [1] "labelled"
## 
## $Q13_4
## [1] "labelled"
## 
## $Q13_5
## [1] "labelled"
## 
## $Q13_6
## [1] "labelled"
## 
## $Q13_7
## [1] "labelled"
## 
## $Q14_1_a
## [1] "labelled"
## 
## $Q14_2_a
## [1] "labelled"
## 
## $Q14_3_a
## [1] "labelled"
## 
## $Q15
## [1] "labelled"
```
