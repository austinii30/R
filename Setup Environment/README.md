# Install Previous R version
### Procedures
1. Download and install a previous version of R from https://cran.csie.ntu.edu.tw/ (for windows, install from https://cran.csie.ntu.edu.tw/bin/windows/base/old/).
1. Download the R-tools that supports the R version from https://cran.r-project.org/bin/windows/Rtools/
1. Add R-tools to the PATH environment variable (for windows, usually, add ```C:\rtools40\usr\bin```).
    * Adding to PATH informs the system where to search for executable files. If R-tools is not added to PATH, error such as ```Warning in system(cmd) : 'make' not foun``` may occur.
    * How to modify system environment variable: https://www.java.com/zh-TW/download/help/path_zh-tw.html
    * Execute ```make -v``` in console to check if ```make``` is correctly installed.
1. Update R packages if necessary (specify ```type="source"``` in ```install.packages()``` if the binary version is too old).
### Notes
* You can add R to PATH as well (for windows, usually, add ```C:\Program Files\R\R-x.x.x\bin```).
    * Execute ```R``` in console to check the currrent R version.
<!-- When knitting files by RMarkDown, RStudio may ask you to install/update some packages. Sometimes, the process will fail, and it may work when you manually install them by ```install.packages()``` -->