# ============================================================ #
# Script used to develop the model(s) considered in the
# sensitivity analysis: Item 5.7 
# ============================================================ #
# 
# Sensitivity analysis summary
# 
# *** 
# Topic of the sensitivity analysis:  model 
# Specific item in that topic: 
# 	- Fix warnings 
# Author:  Team Thornyheads 
# Date: 2023-04-27 13:19:00 
# Name of the model created: 23.fix_warnings 
# *** 
# 
# This analysis has been developped based on the following model: 
# 23.model.recdevs_inityear_1996 
# 
# Results are stored in the following foler: 
#	 /Users/haleyoleynik/Documents/GitHub/shortspine_thornyhead_2023/model/Sensitivity_Anal/5.7_Fix_Warnings 
# 
# Features: 
#Fix warning messages in base model 
# ============================================================ #

# ------------------------------------------------------------ #
# ------------------------------------------------------------ #

# This script holds the code used to develop the models considered in this sensitivity analysis.
# For each model, the base model is modified using the r4ss package.
# The new input files are then written in the root directory of each model and the
# model outputs are stored in the '/run/' folder housed in that directory.
# The results of this sensitivity analysis are analyzed using the following script:
# /Users/haleyoleynik/Documents/GitHub/shortspine_thornyhead_2023/R/ss/Sensitivity_Anal/5.7_Fix_Warnings_Outputs.R 

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


# Compute the hessian matrix 
# For each model, indicate if you want to compute the Hessian matrix.
# If noHess = TRUE for a given model, then the Hessian matrix
# won't be estimated.
# Reminder - The following models are considered:# 	-  23.fix_warnings 
noHess <- c(TRUE)


var.to.save <- ls()
# ----------------------------------------------------------- 

#  3. Developing model 23.fix_warnings  ----
# ----------------------------------------------------------- #

# Path to the 23.fix_warnings repertory
Dir_23_fix_warnings <- file.path(dir_SensAnal, '5.7_Fix_Warnings','1_23.fix_warnings' ,fsep = fsep)

# Add the model directory to the saved variables
var.to.save <- c(var.to.save, 'Dir_23_fix_warnings') 


# For each SS input file, the following variable names will be used:
# Starter file :			 Start23_fix_warnings 
# Data file :			 Dat23_fix_warnings 
# Control file :			 Ctl23_fix_warnings 
# Forecast file :			 Fore23_fix_warnings 


# Do you want to copy the SS input files from the base model?
# This is useful if you are developing a model based on a base model that
# that did not exist when you set up the sensitivity analysis or if you already
# wrote a new SS input file for your new model and need to modify it (It ensure
# to start again from scratch and get the same
# basis of comparison.
Restart_SA_modeldvpt(base.model = "23.model.recdevs_inityear_1996", curr.model = "23.fix_warnings", files="all")


# 3.1  Work on the Starter file ----
# ======================= #
# Read in the file
StarterFile <- file.path(Dir_23_fix_warnings, 'starter.ss', fsep = fsep)
Start23_fix_warnings <- SS_readstarter(
      file = StarterFile,
      verbose = TRUE
      )

# Make your modification if applicable
# Code modifying the starter file
# ..... 
# ..... 


# Save the starter file for the model
# SS_writestarter(
      # mylist =  Start23_fix_warnings ,
      # dir =  Dir_23_fix_warnings, 
      # overwrite = TRUE,
      # verbose = TRUE
      # )

# Check file structure
# StarterFile <- file.path(Dir_23_fix_warnings, 'starter.ss')
#  Start23_fix_warnings <- SS_readstarter(
      # file = StarterFile,
      # verbose = TRUE
      # )

# clean environment
var.to.save <- c(var.to.save, 'Start23_fix_warnings')
rm(list = setdiff(ls(), var.to.save))
var.to.save <- ls()
# =======================

# 3.2  Work on the data file ----
# ======================= #
# Read in the file
DatFile <-file.path(Dir_23_fix_warnings,Start23_fix_warnings$datfile, fsep = fsep)
Dat23_fix_warnings <- SS_readdat_3.30(
      file = DatFile,
      verbose = TRUE,
      section = TRUE
      )

# Make your modification if applicable
# Code modifying the data file 
# ..... 
# ..... 


# Save the data file for the model
# SS_writedat(
      # datlist =  Dat23_fix_warnings ,
      # outfile = file.path(Dir_23_fix_warnings, 'SST_data.ss', fsep = fsep),
      # version = '3.30',
      # overwrite = TRUE
      # )

# Check file structure
# DatFile <- file.path(Dir_23_fix_warnings, 'SST_data.ss', fsep = fsep)
#  Dat23_fix_warnings <-
      # SS_readdat_3.30(
      # file = DatFile,
      # verbose = TRUE,
      # section = TRUE
      # )

# clean environment
var.to.save <- c(var.to.save, 'Dat23_fix_warnings')
rm(list = setdiff(ls(), var.to.save))
var.to.save <- ls()
# =======================

# 3.3  Work on the control file ----
# ======================= #
# The SS_readctl_3.30() function needs the 'data_echo.ss_new' file to read the control file
# This file is created while running SS. You may have had a warning when building
# this script. Please check that the existence of the 'data_echo.ss_new' file
# in the 'run' folder of your new model.
# If the file does not exist, please use the RunSS_CtlFile() function that run SS
# in a designated file.

# Read in the file
Ctlfile <-file.path(Dir_23_fix_warnings,Start23_fix_warnings$ctlfile, fsep = fsep)
Ctl23_fix_warnings <- SS_readctl_3.30(
      file = Ctlfile,
      use_datlist = TRUE,
      datlist = file.path(Dir_23_fix_warnings, 'run','data_echo.ss_new', fsep = fsep),
      verbose = TRUE
      )

# Make your modification if applicable
# Code modifying the control file 
# ..... 
# ..... 

# fix bounds on growth parameters 
Ctl23_fix_warnings$MG_parms["L_at_Amin_Fem_GP_1",]$HI <- 25
Ctl23_fix_warnings$MG_parms["L_at_Amin_Mal_GP_1",]$HI <- 25
Ctl23_fix_warnings$MG_parms["VonBert_K_Fem_GP_1",]$LO <- 0.001
Ctl23_fix_warnings$MG_parms["L_at_Amax_Mal_GP_1",]$HI <- 75

# Fix retention scaling warninsg
# Per Vlada, the parameterization changed in 2017, which is why they showed up
Ctl23_fix_warnings$size_selex_parms["SizeSel_PRet_3_Trawl_N(1)", ]$LO <- -10
Ctl23_fix_warnings$size_selex_parms["SizeSel_PRet_3_Trawl_N(1)", ]$HI <- 10
Ctl23_fix_warnings$size_selex_parms["SizeSel_PRet_3_Trawl_N(1)", ]$INIT <- 2.19722
Ctl23_fix_warnings$size_selex_parms["SizeSel_PRet_3_Trawl_N(1)", ]$PRIOR <- 2.19722

Ctl23_fix_warnings$size_selex_parms["SizeSel_PRet_3_Trawl_S(2)", ]$LO <- -10
Ctl23_fix_warnings$size_selex_parms["SizeSel_PRet_3_Trawl_S(2)", ]$HI <- 11
Ctl23_fix_warnings$size_selex_parms["SizeSel_PRet_3_Trawl_S(2)", ]$INIT <- 10
Ctl23_fix_warnings$size_selex_parms["SizeSel_PRet_3_Trawl_S(2)", ]$PRIOR <- 2.19722
Ctl23_fix_warnings$size_selex_parms["SizeSel_PRet_3_Trawl_S(2)", ]$PHASE <- -3

Ctl23_fix_warnings$size_selex_parms["SizeSel_PRet_3_Non-trawl(3)", ]$LO <- -10
Ctl23_fix_warnings$size_selex_parms["SizeSel_PRet_3_Non-trawl(3)", ]$HI <- 10
Ctl23_fix_warnings$size_selex_parms["SizeSel_PRet_3_Non-trawl(3)", ]$INIT <- 2.19722
Ctl23_fix_warnings$size_selex_parms["SizeSel_PRet_3_Non-trawl(3)", ]$PRIOR <- 2.19722

# Get these parameters off the bounds
# Per Vlada and Kiva, simply fixing the plateau at -15 is legitimate
Ctl23_fix_warnings$size_selex_parms["SizeSel_P_2_Trawl_N(1)",]$LO <- -16
Ctl23_fix_warnings$size_selex_parms["SizeSel_P_2_Trawl_N(1)",]$HI <- 16
Ctl23_fix_warnings$size_selex_parms["SizeSel_P_2_Trawl_N(1)",]$INIT <- -15
Ctl23_fix_warnings$size_selex_parms["SizeSel_P_2_Trawl_N(1)",]$PHASE <- -3

Ctl23_fix_warnings$size_selex_parms["SizeSel_P_2_Triennial1(4)",]$LO <- -16
Ctl23_fix_warnings$size_selex_parms["SizeSel_P_2_Triennial1(4)",]$HI <- 16
Ctl23_fix_warnings$size_selex_parms["SizeSel_P_2_Triennial1(4)",]$INIT <- -7
Ctl23_fix_warnings$size_selex_parms["SizeSel_P_2_Triennial1(4)",]$PHASE <- -3

Ctl23_fix_warnings$size_selex_parms["SizeSel_P_2_Triennial2(5)",]$LO <- -16
Ctl23_fix_warnings$size_selex_parms["SizeSel_P_2_Triennial2(5)",]$HI <- 16
Ctl23_fix_warnings$size_selex_parms["SizeSel_P_2_Triennial2(5)",]$INIT <- -7
Ctl23_fix_warnings$size_selex_parms["SizeSel_P_2_Triennial2(5)",]$PHASE <- -3

# F_Method=4 is the new preferred value
# strcutural changes needed to make work.
Ctl23_fix_warnings$F_Method <- 4
Ctl23_fix_warnings$maxF <- 3.5
Ctl23_fix_warnings$F_4_Fleet_Parms <- data.frame(Fleet = c(1, 2, 3),
                                                 start_F = 0.05,
                                                 first_parm_phase = 99)
Ctl23_fix_warnings$F_iter <- 5

# Save the control file for the model
 SS_writectl(
       ctllist =  Ctl23_fix_warnings ,
       outfile = file.path(Dir_23_fix_warnings, 'SST_control.ss', fsep = fsep),
       version = '3.30',
       overwrite = TRUE
       )
# Check file structure
# We actually need to run the model to check the file structure

# clean environment
var.to.save <- c(var.to.save, 'Ctl23_fix_warnings')
rm(list = setdiff(ls(), var.to.save))
var.to.save <- ls()
# =======================

# 3.4  Work on the forecast file ----
# ======================= #

# Read in the file
ForeFile <- file.path(Dir_23_fix_warnings, 'forecast.ss', fsep = fsep)
Fore23_fix_warnings <-SS_readforecast(
      file = ForeFile,
      version = '3.30',
      verbose = T,
      readAll = T
      )

# Make your modification if applicable
# Code modifying the forecast file 
# ..... 
# ..... 


# Save the forecast file for the model
# SS_writeforecast(
      # mylist =  Fore23_fix_warnings ,
      # dir = Dir_23_fix_warnings, 
      # file = 'forecast.ss',
      # writeAll = TRUE,
      # verbose = TRUE,
      # overwrite = TRUE
      # )

# Check file structure
# ForeFile <- file.path(Dir_23_fix_warnings, 'forecast.ss', fsep = fsep)
#  Fore23_fix_warnings <-SS_readforecast(
      # file = ForeFile,
      # version = '3.30',
      # verbose = T,
      # readAll = T
      # )

# clean environment
var.to.save <- c(var.to.save, 'Fore23_fix_warnings')
rm(list = setdiff(ls(), var.to.save))
var.to.save <- ls()
# =======================

# If you are done with your implementations, you can now run this new model

# *********************************************************** #
# 3.5  Run the new model using the new input files ----
# ======================= #
run_SS(SS_version = '3.30.21',
      # version of SS
      base_path =Dir_23_fix_warnings,
      # root directory where the input file are housed
      pathRun = NULL,
      # A 'run' folder is created if needed (where output files will be stored)
      copy_files = TRUE,
      # copy the input files from the23.fix_warningsfolder
      cleanRun = TRUE,
      # clean the folder after the run
      extra = NULL#ifelse(noHess[1], yes = '-nohess', no = NULL)
      # this is if we want to use '-nohess'
      )

# 3.6  Let's plot the outputs from this model ----
# ======================= #
# read the model output and print diagnostic messages
Dirplot <- file.path(Dir_23_fix_warnings, 'run', fsep = fsep)

replist <- SS_output(
      dir = Dirplot,
      verbose = TRUE,
      printstats = TRUE
      )

# plots the results (store in the 'plots' sub-directory)
SS_plots(replist,
      dir = Dirplot,
      printfolder = 'plots'
      )

# =======================


# -----------------------------------------------------------
# -----------------------------------------------------------

## End section ##

# You are ready to analyze the differences between the models
# considered in this sensitivity analysis.
# This can be done using the 5.7_Fix_Warnings_Outputs.R script.

# !!!!! WARNING !!!!!
# ------------------- #
# Please do not develop any script that you want to keep after this 
# warning section - It might be overwritten in the case you add a new 
# model to this SA.
# ------------------- #

## End script to develop SA models ##

# -----------------------------------------------------------
# -----------------------------------------------------------
