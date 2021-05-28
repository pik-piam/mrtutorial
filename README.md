# Tutorial Package For Madrat Package Library

R package **mrtutorial**, version **0.2.4**

[![CRAN status](https://www.r-pkg.org/badges/version/mrtutorial)](https://cran.r-project.org/package=mrtutorial)    

## Purpose and Functionality

Example package of mr- world libraries, in conjunction with MAgPIE MADRat tutorial. For more information please see: https://github.com/magpiemodel/tutorials/tree/master/madrat .


## Installation

For installation of the most recent package version an additional repository has to be added in R:

```r
options(repos = c(CRAN = "@CRAN@", pik = "https://rse.pik-potsdam.de/r/packages"))
```
The additional repository can be made available permanently by adding the line above to a file called `.Rprofile` stored in the home folder of your system (`Sys.glob("~")` in R returns the home directory).

After that the most recent version of the package can be installed using `install.packages`:

```r 
install.packages("mrtutorial")
```

Package updates can be installed using `update.packages` (make sure that the additional repository has been added before running that command):

```r 
update.packages()
```

## Questions / Problems

In case of questions / problems please contact David Meng-Chuen Chen <david.chen@pik-potsdam.de>.

## Citation

To cite package **mrtutorial** in publications use:

Chen D (2021). _mrtutorial: Tutorial Package For Madrat Package Library_. R package version 0.2.4.

A BibTeX entry for LaTeX users is

 ```latex
@Manual{,
  title = {mrtutorial: Tutorial Package For Madrat Package Library},
  author = {David Meng-Chuen Chen},
  year = {2021},
  note = {R package version 0.2.4},
}
```

