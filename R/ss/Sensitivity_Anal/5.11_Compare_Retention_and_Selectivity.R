rm(list = ls(all.names = TRUE)) 

# 1. Update r4ss ----

update <- FALSE 

if (update) { 
  # Indicate the library directory to remove the r4ss package from
  mylib <- '~/R/win-library/4.1' 
  remove.packages('r4ss', lib = mylib) 
  # Install r4ss from GitHub 
  pak::pkg_install('r4ss/r4ss') 
} 
# ----------------------------------------------------------- 

# 2. Set up ---- 

rm(list = ls(all.names = TRUE)) 
# Local declaration 
fsep <- .Platform$file.sep #easy for file.path() function 

# packages 
library(r4ss) 
library(dplyr) 
library(reshape2) 
library(stringr) 

# Directories 
# Path to the model folder 
dir_model <- file.path(here::here(), 'model', fsep = fsep)

# Path to the Executable folder 
Exe_path <- file.path(dir_model, 'ss_executables') 

# Path to the R folder 
dir_script <- file.path(here::here(), 'R', fsep = fsep)

# Path to the Sensitivity analysis folder 
dir_SensAnal <- file.path(dir_model, 'Sensitivity_Anal', fsep = fsep)

# Path to data folder 
dir_data <- file.path(here::here(), 'data', 'for_ss', fsep = fsep)

# Useful function
source(file=file.path(dir_script,'utils','clean_functions.R', fsep = fsep))
source(file=file.path(dir_script,'utils','ss_utils.R', fsep=fsep))
source(file=file.path(dir_script,'utils','sensistivity_analysis_utils.R', fsep=fsep))

# Load the .Rdata object with the parameters and data for 2023
load(file.path(dir_data,'SST_SS_2023_Data_Parameters.RData', fsep = fsep))
# Save directories and function
# var.to.save <- c('dir_model',
# 'Exe_path',
# 'dir_script',
# 'dir_SensAnal') 

var.to.save <- ls()
# ----------------------------------------------------------- 

# 3.4  Make comparison plots between models ----
# ======================= #

# Use the SSgetoutput() function that apply the SS_output()
# to get the outputs from different models


# Path to the base model (23.model.francis_2) repertory
Dir_23_model_francis_2 <- file.path(dir_SensAnal, '5.8_Francis_Reweighting_2', '1_23.model.francis_2', 'run', fsep = fsep)


# Path to the base model (23.blkret.T3) repertory
Dir_23_blkret_T1 <- file.path(dir_SensAnal, '5.9_Retention_Selectivity_Sensitivity', '3_23.blkret.T1', 'run', fsep = fsep)


# Path to the base model (23.blkret.T3) repertory
Dir_23_blkret_T2 <- file.path(dir_SensAnal, '5.9_Retention_Selectivity_Sensitivity', '3_23.blkret.T2', 'run', fsep = fsep)


# Path to the base model (23.blkret.T3) repertory
Dir_23_blkret_T3 <- file.path(dir_SensAnal, '5.9_Retention_Selectivity_Sensitivity', '3_23.blkret.T3', 'run', fsep = fsep)


# Path to the base model (23.blkret.T3) repertory
Dir_23_blkret_T4 <- file.path(dir_SensAnal, '5.9_Retention_Selectivity_Sensitivity', '3_23.blkret.T4', 'run', fsep = fsep)

# Path to the base model (23.blkret.T3) repertory
Dir_23_blkret_T3_NT1 <- file.path(dir_SensAnal, '5.9_Retention_Selectivity_Sensitivity', '3_23.blkret.T3.NT1', 'run', fsep = fsep)

# Path to the base model (23.blkret.T3) repertory
Dir_23_blkret_T3_NT2 <- file.path(dir_SensAnal, '5.9_Retention_Selectivity_Sensitivity', '3_23.blkret.T3.NT2', 'run', fsep = fsep)

# Root directory for this sensitivity analysis
SA_path <- file.path('model','Sensitivity_Anal','5.1011_Retention_Selectivity_Comparison',fsep = fsep)
# Path to the 23.blksel.T1 repertory
Dir_23_blksel_T1 <- file.path(dir_SensAnal, '5.11_Selectivity_Sensitivity','1_23.blksel.T1' , 'run',fsep = fsep)

# Path to the 23.blksel.T2 repertory
Dir_23_blksel_T2 <- file.path(dir_SensAnal, '5.11_Selectivity_Sensitivity','2_23.blksel.T2' , 'run',fsep = fsep)

# Path to the 23.blksel.T3 repertory
Dir_23_blksel_T3 <- file.path(dir_SensAnal, '5.11_Selectivity_Sensitivity','3_23.blksel.T3' , 'run',fsep = fsep)

# Path to the 23.blksel.T4 repertory
Dir_23_blksel_T4 <- file.path(dir_SensAnal, '5.11_Selectivity_Sensitivity','4_23.blksel.T4' , 'run',fsep = fsep)

# Path to the 23.blkret.T3.blksel.T1 repertory
Dir_23_blkret_T3_blksel_T1 <- file.path(dir_SensAnal, '5.11_Selectivity_Sensitivity','5_23.blkret.T3.blksel.T1' , 'run',fsep = fsep)

# Path to the 23.blkret.T3.blksel.T2 repertory
Dir_23_blkret_T3_blksel_T2 <- file.path(dir_SensAnal, '5.11_Selectivity_Sensitivity','6_23.blkret.T3.blksel.T2' , 'run',fsep = fsep)

# Path to the 23.blkret.T3.blksel.T3 repertory
Dir_23_blkret_T3_blksel_T3 <- file.path(dir_SensAnal, '5.11_Selectivity_Sensitivity','7_23.blkret.T3.blksel.T3' , 'run',fsep = fsep)

# Path to the 23.blkret.T3.blksel.T4 repertory
Dir_23_blkret_T3_blksel_T4 <- file.path(dir_SensAnal, '5.11_Selectivity_Sensitivity','8_23.blkret.T3.blksel.T4' , 'run',fsep = fsep)

# Extract the outputs for all models
SensiMod <- SSgetoutput(dirvec = c(
  Dir_23_model_francis_2,
  #Dir_23_model_francis_2,
  #Dir_23_model_francis_2,
  #Dir_23_model_francis_2,
  Dir_23_blkret_T1,
  Dir_23_blkret_T2,
  Dir_23_blkret_T3,
  Dir_23_blkret_T4,
  Dir_23_blkret_T3_NT1,
  Dir_23_blkret_T3_NT2,
  Dir_23_blksel_T1,
  Dir_23_blksel_T2,
  Dir_23_blksel_T3,
  Dir_23_blksel_T4,
  Dir_23_blkret_T3_blksel_T1,
  Dir_23_blkret_T3_blksel_T2,
  Dir_23_blkret_T3_blksel_T3,
  Dir_23_blkret_T3_blksel_T4))

# Rename the list holding the report files from each model
names(SensiMod)
names(SensiMod) <- c(
  '23.model.francis_2',
  #'23.model.francis_2',
  #'23.model.francis_2',
  #'23.model.francis_2',
  '23.blkret.T1',
  '23.blkret.T2',
  '23.blkret.T3',
  '23.blkret.T4',
  '23.blkret.T3.NT1',
  '23.blkret.T3.NT2',
  '23.blksel.T1',
  '23.blksel.T2',
  '23.blksel.T3',
  '23.blksel.T4',
  '23.blkret.T3.blksel.T1',
  '23.blkret.T3.blksel.T2',
  '23.blkret.T3.blksel.T3',
  '23.blkret.T3.blksel.T4')

# summarize the results
Version_Summary <- SSsummarize(SensiMod)

# make plots comparing the models
SSplotComparisons(
  Version_Summary,
  # print = TRUE,
  pdf = TRUE,
  plotdir = file.path(SA_path, 'SA_plots', fsep = fsep),
  legendlabels = c(
    '23.model.francis_2',
    #'23.model.francis_2',
    #'23.model.francis_2',
    #'23.model.francis_2',
    '23.blkret.T1',
    '23.blkret.T2',
    '23.blkret.T3',
    '23.blkret.T4',
    '23.blkret.T3.NT1',
    '23.blkret.T3.NT2',
    '23.blksel.T1',
    '23.blksel.T2',
    '23.blksel.T3',
    '23.blksel.T4',
    '23.blkret.T5',
    '23.blkret.T6',
    '23.blkret.T7',
    '23.blkret.T8')
)

# Create comparison table for this analisys
# ####################################### #

SStableComparisons(Version_Summary)

tmp <- purrr::transpose(SensiMod)$parameters %>%
  purrr::map_df(~dplyr::as_tibble(.x), .id = 'Model') %>%
  dplyr::select(Model, Label, Value, Phase, Min, Max, Init,
                Gradient, Pr_type, Prior, Pr_SD, Pr_Like,
                LCI95 = `Value-1.96*SD`, UCI95 = `Value+1.96*SD`)

tmp %>%
  readr::write_csv(paste(SA_path, 'Update_Data_comparison_table_all_params.csv', sep = fsep))

tmp %>%
  dplyr::filter(grepl('LnQ|R0', Label)) %>%
  tidyr::pivot_wider(id_cols = c(Label, Phase), names_from = Model, values_from = Value) %>%
  readr::write_csv(paste(SA_path, 'Update_Data_comparison_table_lnQ_SRlnR0.csv', sep = fsep))

out <- SStableComparisons(Version_Summary)
names(out) <- c('Label', unique(tmp$Model))

out %>%
  readr::write_csv(paste(SA_path, 'Update_Data_comparison_table_likelihoods_and_brps.csv', sep = fsep))
