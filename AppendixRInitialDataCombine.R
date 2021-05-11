#  This was the initial merging technique for the daily CSV and XLSX files to allow easier cleaning

# MERGE CSV
path <-"Path To CSV Files"
df <- list.files(path=path, full.names=TRUE) %>% 
  lapply(read_csv) %>%
  bind_rows

# MERGE XLSX FILES
setwd("Path To XLSX Files")
lst = list.files(full.names=TRUE)
df = data.frame()
for(table in lst){
  dataFromExcel <- read_excel(table)
  df <- rbind(df, dataFromExcel)
}