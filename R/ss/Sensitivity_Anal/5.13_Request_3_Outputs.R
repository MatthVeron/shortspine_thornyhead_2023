# ============================================================ #
# Script used to analyze and compare the model(s) considered in the
# sensitivity analysis: Item 5.13 
# ============================================================ #
# 
# Sensitivity analysis summary
# 
# *** 
# Topic of the sensitivity analysis:  model 
# Specific item in that topic: 
# 	- Fix M at 0.045 
# 	- Fix M at 0.05 
# Author:  Matthieu VERON 
# Date: 2023-06-06 15:25:46 
# Names of the models created:
# 	- 23.STAR.Panel.M.045 
# 	- 23.STAR.Panel.M.05 
# *** 
# 
# This analysis has been developed based on the following model(s): 
# New model 					 Base model
# 23.STAR.Panel.M.045 				 23.model.francis_2 
# 23.STAR.Panel.M.05 				 23.model.francis_2 
# 
# Results are stored in the following foler: 
#	 C:/Users/Matthieu Verson/Documents/GitHub/Forked_repos/shortspine_thornyhead_2023/model/Sensitivity_Anal/STAR_Panel/5.13_Request_3 
# 
# General features: 
# Provide two sensitivity runs with M=0.045 and M=0.05 
# 
# Model features:
# - Model 23.STAR.Panel.M.045:
# This model fixes M at 0.045 
# - Model 23.STAR.Panel.M.05:
# This model fixes M at 0.05 
# ============================================================ #

# ------------------------------------------------------------ #
# ------------------------------------------------------------ #

# The results of the model run have been plot in the 'plots' sub-directory of
# the 'run' folder. The comparison plots between models for the sensitivity analysis will be
# stored in the 'SA_plots' folder housed in the root directory of this sensitivity analysis.

# ------------------------------------------------------------ #
# ------------------------------------------------------------ #

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
dir_SensAnal <- file.path(dir_model, 'Sensitivity_Anal', 'STAR_Panel', fsep = fsep)

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
Dir_23_model_francis_2 <- file.path(dirname(dir_SensAnal), '5.8_Francis_Reweighting_2', '1_23.model.francis_2', 'run', fsep = fsep)

# Root directory for this sensitivity analysis
SA_path <- file.path('model','Sensitivity_Anal','STAR_Panel','5.13_Request_3',fsep = fsep)

# Path to the 23.STAR.Panel.M.045 repertory
Dir_23_STAR_Panel_M_045 <- file.path(dir_SensAnal, '5.13_Request_3','1_23.STAR.Panel.M.045' , 'run',fsep = fsep)

# Path to the 23.STAR.Panel.M.05 repertory
Dir_23_STAR_Panel_M_05 <- file.path(dir_SensAnal, '5.13_Request_3','2_23.STAR.Panel.M.05' , 'run',fsep = fsep)

# Extract the outputs for all models
SensiMod <- SSgetoutput(dirvec = c(
	Dir_23_model_francis_2,
	Dir_23_STAR_Panel_M_045,
	Dir_23_STAR_Panel_M_05))

# Rename the list holding the report files from each model
names(SensiMod)
names(SensiMod) <- c(
	'23.model.francis_2',
	'23.STAR.Panel.M.045',
	'23.STAR.Panel.M.05')

# summarize the results
Version_Summary <- SSsummarize(SensiMod)

# make plots comparing the models
SSplotComparisons(
      Version_Summary,
      print = TRUE,
      # pdf = TRUE,
      plotdir = file.path(SA_path, 'SA_plots', fsep = fsep),
      legendlabels = c(
        "Base", 
        "M fixed to 0.045",
        "M fixed to 0.05")
    )




SSplotComparisons(
  Version_Summary,
  print = TRUE,
  subplots = 13,ylimAdj = 1.2,
  # pdf = TRUE,
  plotdir = file.path(SA_path, 'SA_plots', fsep = fsep),
  legendlabels = c(
    "Base", 
    "M fixed to 0.045",
    "M fixed to 0.05")
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

out <- SStableComparisons(Version_Summary,
                          names = c(
                            "Recr_Virgin",
                            "R0",
                            "steep",
                            "NatM",
                            "L_at_Amax",
                            "VonBert_K",
                            "SSB_Virg",
                            "Bratio_2023",
                            "SPRratio_2022"),
                          modelnames = c(
                            "Base", 
                            "M fixed to 0.045",
                            "M fixed to 0.05"))
#names(out) <- c('Label', unique(tmp$Model))

out %>%
  readr::write_csv(paste(SA_path, 'Update_Data_comparison_table_likelihoods_and_brps.csv', sep = fsep))


# Save table for the STAR Panel request
require(magick)
out
colnames(out) <- c("", "Base", "M fixed to 0.045","M fixed to 0.05")

out %>%
  kbl() %>%
  kable_classic(full_width = T, html_font = "Times New Roman") %>%
  save_kable(file = file.path(here::here(), "outputs", "summary_SA_table.jpeg"),
             zoom = 2)

