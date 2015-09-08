pollutantmean <-function(directory, polluntant, id = 1:332) {
  library(stringr);
  library(dplyr);
  
  ## get files location
  str_id <- sapply(id, str_pad, 3, pad = "0");
  files <- paste(paste(directory, str_id, sep="/"), ".csv", sep="");
  
  ## Read csv
  ldf <- lapply(files, read.csv);
  ldfnona = lapply(ldf, na.omit)
#  lnitrate = sapply(ldfnona, select, nitrate)
#  print(csvs)
  
#  print(val);
#  for (csv in csvs) {
#    cases <- complete.cases(X)
#    print(cases)
#    print(X[cases]);
#  }
#  print(csvs);
#  csvs
  
#  str_id <- "001";
#  file <- paste(paste(directory, str_id, sep="/"), ".csv", sep="");
#  csv <- read.csv(file, header = TRUE, );
#  nitr = select(na.omit(csv), sulfate, nitrate);
#  themean = sapply(nitr, mean)
#  rownames(themean) <- "mean";
      
#  nona = na.omit(csv);
#  colMeans(nona, dims = 1)
      
#  return(read.csv(file));
#  cases = complete.cases(file);
#  print(file[cases])
  
	## Return the mean of the pollutant across all monitors list
	## in the 'id' vector (ignoring NA values)
	## NOTE: Do not round the result!
}
