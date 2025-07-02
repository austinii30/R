############################################################################
# Filename: Functions.R
# Purpose : Some handy functions in handling data
# Author  : Potumas Liu
# Date    : 2024/12/07
############################################################################


alterResponseColumnName <- function(data, orgName, altName="y") {
  " Change the name of the response column. 
    [Args]
      data      (df): the data-frame to change
      orgName (char): the original name of the response
      altName (char): the altered name
    [Return]
      data (df): the data-frame after changing the name of the response
  "
  if (! orgName %in% colnames(data))
    stop("Invalid response column specified.")
  if (length(orgName) != 1)
    stop("Can only set up 1 response column")
  
  colIdx <- which(colnames(data) == orgName)
  colnames(data)[colIdx] = altName
   
  return(data)
}


recognizeRowNames <- function(data, column, delete=T) {
  " Recognize a row as the row name for each obs. (and delete the row) "
  
  if (! column %in% colnames(data))
    stop("Invalid column for row names was specified.")
  if (length(column) != 1)
    stop("Can only set up 1 column for row names")
  
  colIdx <- which(colnames(data) == column)
  rownames(data) = data[, colIdx]
  
  if (delete)
    return(data[, -colIdx])
    
  return(data)
}


factorizeVariables <- function(data, otherTypes=c(), specificCols=c()) {
  " Convert 'character' and 'logical' variables into 'factor'.
    [Args]
      data           (df): the input data.frame
      otherTypes   (char): additional data types that should be factorized
      specificCols (char): specific columns to factorize
    [Return]
      data (df): the data.frame that has been converted
  "
  
  if (class(data) != "data.frame") 
    stop("Input data must be a data-frame.") 
  
  typeToConvert <- c("character", "logical", otherTypes) 
  
  for (col in 1:ncol(data))
    if (class(data[, col]) %in% typeToConvert
        | colnames(data)[col] %in% specificCols) 
      data[, col] <- as.factor(data[, col])
      
  return(data)
}

scatterPlot <- function(v1, v2, v1Name, v2Name) {
  factors <- 0
  varX <- v1; varY <- v2
  varXName <- v1Name; varYName <- v2Name
  if (class(v1) == "factor") {
    factors <- factors + 1
  } else if (class(v2) == "factor") {
    varX = v2; varY = v1
    factors <- factors + 1
  }
    
  plot(x = varX, y = varY,
       xlab = varXName, ylab = varYName, 
       col = "blue")
  
  if (factors == 1)
    stripchart(varY ~ varX, 
               vertical = TRUE, 
               method = "jitter", 
               add = TRUE, 
               pch = 20, 
               col = "red")
}

reducedScatterPlotMatrix <- function(data) {
  n = ncol(data)   
  n = ceiling(sqrt(n*(n-1)/2))
  n = min(n, 2)
  par(mfrow = c(n, n))
  
  for (i in 1:(ncol(data)-1))
    for (j in (i+1):ncol(data))
      scatterPlot(data[, i], data[, j], colnames(data)[i], colnames(data)[j])
   
  par(mfrow = c(1, 1)) 
}
