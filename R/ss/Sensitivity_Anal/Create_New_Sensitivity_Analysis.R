# Create a new Sensitivity analysis
# Author: Matthieu VERON
# Contact: mveron@uw.edu

# This script can be used to create a new sensitivity analysis.
# Functions used are hold in the script "R/utils/sensistivity_analysis_utils.R"
# The NewSensAnal() function is the main function to use when creating a new sensitivity
# analysis.
# ============================================================================ #
# ============================================================================ #
#'
#' The function creates:
#' 1. one folder named as \code{folder_name} in the 
#'    "shortspine_thornyhead_2023/model/Sensitivity_Anal" repertory. This folder will
#'    house model input and output files,
#' 2. the "Sensitivity_Analysis_Features.txt" file (in the previously created folder).
#'    This file summaryzes the features of the sensitivity analysis 
#'    (\code{topic}, \code{object}, \code{author}, ...)
#' 3. Update the "Summary_Sensitivity_analysis.pdf" file housed in the root folder.
#' 4. Update the "Models_Sensitivity_analysis.pdf" file housed in the root folder.
#' 5. Generate SA-specific templates for the scripts to build and analyze the models.
#'    
#' @param topic (character string)- Indicates the main topic of the sensitivity 
#' analysis. This HAS to be either"transition",  "landings", "discards", "surveys",
#' "biological_Info", or "model".
#' @param object (character string)- Indicates a specific item of 
#' the main topic/model. For example, "Length_Comp", "Age_comp", "Growth", "Fecundity",...
#' If multiple models are built, the length of \code{object} equals the numder of
#' models with a specific input for each model.
#' @param author (character string)- Who leads the sensitivity analysis and runs
#' the model.
#' @param folder_name (character string)- name of the folder to create for that 
#' particular sensitivity analysis. This folder will be housed in the root folder 
#' 'Sensitivity_Anal' and will hold the scripts  used to set up the model and both 
#' models input and output files for this analysis.
#' @param script_model (character string)- Name of the script used to create the 
#' model (without extension).
#' @param script_results (character string)- Name of the script used to analyze 
#' the results from that sensitivity analysis  (without extension).
#' @param base_model (character string)- which model has been used as the basis 
#' of this analysis (before any modification). By default, the function considers
#' the 2013 Assessment model transitioned to the 3.30 version of SS with all
#' parameters estimated i.e., \code{"23.sq.est"}(See "Models_Sensitivity_analysis.pdf")
#' @param new_model (character string)- name of the model you're gonna develop for
#' this analysis.
#' 
# ============================================================================ #
# ============================================================================ #


rm(list = ls(all.names = TRUE))

# 1. Set up ----
# ---------------------------------------------------------- #
# load packages ----

updateKableExtra <- FALSE # Needed the first time

if(updateKableExtra)
  devtools::install_github(repo="haozhu233/kableExtra", ref="a6af5c0")
library(kableExtra)

# Local declarations ----
fsep <- .Platform$file.sep

# Set directories ----
dir_model <- file.path(here::here(), "model", fsep = fsep)
dir_script <- file.path(here::here(), "R", fsep = fsep)


# Set up the Sensitivity Analysis root folders ----
dir_SensAnal <- file.path(dir_model, "Sensitivity_Anal", fsep = fsep)
dirScript_SensAnal  <- file.path(dir_script, "ss", "Sensitivity_Anal", fsep = fsep)

# load functions ----
source(file.path(dir_script, "utils", "sensistivity_analysis_utils.R", fsep = fsep))

# ----------------------------------------------------------


# 2. Set up a new sensitivity analysis ----
# ---------------------------------------------------------- #


# NewSensAnal(topic = "transition",
#             object = c("All Param fixed","Floating Q", "All Param estimated"),
#             author = "Matthieu VERON",
#             folder_name = "Bridging_models",
#             script_model = "Bridging_models_Analyses",
#             script_results = "Bridging_models_Outputs",
#             base_model = c("23.sq.fixQ"),
#             new_model = c("23.sq.fix","23.sq.floatQ","23.sq.est"))

# we're keeping simple data updates as topic == 'transition'

# Bridging models 
# NewSensAnal(topic = "transition",
#             # names are based on new model 
#             object = c("Update landings","Updates discard rates", "Update survey indices",
#                        "Update survey length comps", "Update fisheries length comps", 
#                        "Update discard mean weights", "Update growth", "Update maturity",
#                        "Update fecundity", "Update natural mortality"),
#             author = "Team Thornyheads",
#             folder_name = "Update_Data",
#             script_model = "Update_Data_Analyses",
#             script_results = "Update_Data_Outputs",
#             base_model = c("23.sq.floatQ", "23.land.update", "23.disc.update", 
#                            "23.surv_db.update", "23.lcs_survey.update", "23.lcs_fisheries.update", 
#                            "23.disc_weight.update", "23.growth.update", "23.maturity.update", 
#                            "23.fecundity.update"),
#             new_model = c("23.land.update", "23.disc.update", "23.surv_db.update",
#                           "23.lcs_survey.update", "23.lcs_fisheries.update", "23.disc_weight.update",
#                           "23.growth.update", "23.maturity.update", "23.fecundity.update", 
#                           "23.mortality.update"))

# Begin model exploration 
#NewSensAnal(topic = "model",
#            # names are based on new model 
#            object = c("Update Terminal RecDev Year", "Update Initial RecDev Year", "S-R Steepness", "Bias Adjustment Years" ),
#            author = "Team Thornyheads",
#            folder_name = "Explore_RecDevs",
#            script_model = "Explore_RecDevs_Analyses",
#            script_results = "Explore_RecDevs_Outputs",
#            base_model = c("23.mortality.update", "23.model.recdevs_termYear", "23.model.recdevs_initYear", 
#                           "23.model.recdevs_steep"),
#            new_model = c("23.model.recdevs_termYear", "23.model.recdevs_initYear", "23.model.recdevs_steep",
#                          "23.model.recdevs_bias"))

# Fleet Structure models
# NewSensAnal(topic = "model",
#             # names are based on new model 
#             object = c("ThreeFleets_NoSlope_SplitTriennial", "ThreeFleets_UseSlope_CombineTriennial", "FourFleets_UseSlope_CombineTriennial", "FourFleets_NoSlope_CombineTriennial", "ThreeFleets_NoSlope_CombineTriennial" ),
#             author = "Team Thornyheads",
#             folder_name = "Explore_FleetStructure",
#             script_model = "Explore_FleetStructure_Analyses",
#             script_results = "Explore_FleetStructure_Outputs",
#             base_model = c("23.model.recdevs_bias", "23.model.recdevs_bias", "23.model.recdevs_bias", 
#                            "23.model.recdevs_bias", "23.model.recdevs_bias"),
#             new_model = c("23.model.fleetstruct_1", "23.model.fleetstruct_2", "23.model.fleetstruct_3",
#                           "23.model.fleetstruct_4", "23.model.fleetstruct_5"))

# Francis Reweighting
# NewSensAnal(topic = "model",
#             # names are based on new model 
#             object = c("Francis Reweighting"),
#             author = "Team Thornyheads",
#             folder_name = "Francis_Reweighting",
#             script_model = "Francis_Reweighting_Analyses",
#             script_results = "Francis_Reweighting_Outputs",
#             base_model = c("23.model.fleetstruct_5"),
#             new_model = c("23.model.francis"))


# NewSensAnal(topic = "model",
#             # names are based on new model
#             object = c("Survey Timing", "Settlement Events"),
#             author = "Team Thornyheads",
#             folder_name = "SS_Model_Warnings",
#             script_model = "SS_Model_Warnings_Analyses",
#             script_results = "SS_Model_Warnings_Outputs",
#             base_model = c("23.model.francis", "23.model.survey_timing"),
#             new_model = c("23.model.survey_timing", "23.model.settlement_events"))

#NewSensAnal(topic = "model",
#            # names are based on new model
#            object = c("Remove small sample size LCs", "Sex-Specific Survey Selectivity", "Improve Trawl_N LC Fit", "Improve Other LC Fits"),
#            author = "Team Thornyheads",
##            folder_name = "Improve_LC_Fits",
#            script_model = "Improve_LC_Fits_Analyses",
#            script_results = "Improve_LC_Fits_Outputs",
#            base_model = c("23.model.settlement_events", "23.model.sample_sizes", "23.model.sexed_survey_selectivity", "23.model.improve_trawln"),
#            new_model = c("23.model.sample_sizes", "23.model.sexed_survey_selectivity", "23.model.improve_trawln", "23.model.improve_other"))

# NewSensAnal(topic = "model",
#             # names are based on new model
#             object = c("Modify recdev init year"),
#             author = "Team Thornyheads",
#             folder_name = "Update_Recdevs_Inityear",
#             script_model = "Update_Recdevs_Inityear_Analyses",
#             script_results = "Update_Recdevs_Inityear_Outputs",
#             base_model = c("23.model.sexed_survey_selectivity"),
#             new_model = c("23.model.recdevs_inityear_1996"))

#NewSensAnal(topic = "model",
#            # names are based on new model
#            object = c("Fix warnings"),
#            author = "Team Thornyheads",
#            folder_name = "Fix_Warnings",
#            script_model = "Fix_Warnings_Analyses",
#            script_results = "Fix_Warnings_Outputs",
#            base_model = c("23.model.recdevs_inityear_1996"),
#            new_model = c("23.fix_warnings"))

#Growth sensitivity
#NewSensAnal(topic = "biological_Info",
            # names are based on new model
#            object = c("Growth Sensitivity High","Growth Sensitivity Low"),
#            author = "Sabrina Beyer and Jane Sullivan",
#            folder_name = "Growth_Sensitivity",
#            script_model = "Growth_Sensitivity_Analyses",
#            script_results = "Growth_Sensitivity_Outputs",
#            base_model = c("23.model.francis_2", "23.model.francis_2"),
#            new_model = c("23.growth.high", "23.growth.low"))

# #maturity sensitivity
# NewSensAnal(topic = "biological_Info",
#             # names are based on new model
#             object = c("PG maturity","Intermediate maturity curve"),
#             author = "Sabrina Beyer and Jane Sullivan",
#             folder_name = "Maturity_Sensitivity",
#             script_model = "Maturity_Sensitivity_Analyses",
#             script_results = "Maturity_Sensitivity_Outputs",
#             base_model = c("23.model.francis_2", "23.model.francis_2"),
#             new_model = c("23.maturity.pgcurve", "23.maturity.mix_curve"))


#landings sensitivity
#NewSensAnal(topic = "landings",
#            # names are based on new model
#            object = c("Imputed historical landings","2013 assessment landings"),
#            author = "Adam Hayes",
#            folder_name = "Landings_Sensitivity",
#            script_model = "Landings_Sensitivity_Analyses",
#            script_results = "Landings_Sensitivity_Outputs",
#            base_model = c("23.model.francis_2","23.model.francis_2"),
#            new_model = c("23.land.hist_impute","23.land.2013"))

#gamma vs ln error geostat indices sensitivity
#NewSensAnal(topic = "surveys",
#            # names are based on new model
#            object = c("gamma vs ln error"),
#            author = "Andrea Odell",
#            folder_name = "surveys_Sensitivity",
#            script_model = "surveys_Sensitivity_Analyses",
#            script_results = "surveys_Sensitivity_Outputs",
#            base_model = c("23.model.francis_2"),
#            new_model = c("23.surveys.gamvln"))

# Sensitivity analysis 
# NewSensAnal(topic = "model",
#             # names are based on new model
#             object = c("blk Trawl 89", "blk Trawl mid10",
#                        "blk Trawl 89-mid10", "blk Trawl 89-mid10-19",
#                        "blk Trawl 89-mid10 NonTrawl 05-13", "blk Trawl 89-mid10 NonTrawl 05-13-17"),
#             author = "Pierre-Yves Hernvann",
#             folder_name = "Retention_Selectivity_Sensitivity",
#             script_model = "Retention_Sensitivity_Analyses",
#             script_results = "Retention_Sensitivity_Outputs",
#             base_model = c("23.model.francis_2", "23.model.francis_2",
#                            "23.model.francis_2", "23.model.francis_2",
#                            "23.model.francis_2", "23.model.francis_2"),
#             new_model = c("23.blkret.T1", "23.blkret.T2",
#                           "23.blkret.T3","23.blkret.T4",
#                           "23.blkret.T3.NT1", "23.blkret.T3.NT2"))


#remove_SA("Item 5.10")
#
#NewSensAnal(topic = "model",
#            # names are based on new model
#            object = c("Prior on Selectivity - 1 Blk",
#                       "Prior on Selectivity - 2 Blks",
#                       "Prior on Selectivity - 3 Blks"
#                       ),
#            author = "Pierre-Yves Hernvann & Matthieu Veron",
#            folder_name = "Prior_Selectivity_Sensitivity",
#            script_model = "Prior_Sensitivity_Analyses",
#            script_results = "Prior_Sensitivity_Outputs",
#            base_model = c("23.blkret.T3"),
#            new_model = c("23.slx.Prior.1Blk",
#                          "23.slx.Prior.2Blk",
#                          "23.slx.Prior.3Blk"))

# Sensitivity analysis: selectivity 
NewSensAnal(topic = "model",
            # names are based on new model
            object = c("base blksel 2003", "base blksel 2011",
                       "base blksel 2003+2011", "base blksel 2003+2011+2019",
                       "blkretT3 blksel 2003", "blkretT3 blksel 2011",
                       "blkretT3 blksel 2003+2011", "blkretT3 blksel 2003+2011+2019"),
            author = "Pierre-Yves Hernvann",
            folder_name = "Selectivity_Sensitivity",
            script_model = "Selectivity_Sensitivity_Analyses",
            script_results = "Selectivity_Sensitivity_Outputs",
            base_model = c("23.model.francis_2", "23.model.francis_2",
                           "23.model.francis_2", "23.model.francis_2",
                           "23.blkret.T3", "23.blkret.T3",
                           "23.blkret.T3","23.blkret.T3"),
            new_model = c("23.blksel.T1", "23.blksel.T2",
                          "23.blksel.T3","23.blksel.T4",
                          "23.blkret.T3.blksel.T1", "23.blkret.T3.blksel.T2",
                          "23.blkret.T3.blksel.T3", "23.blkret.T3.blksel.T4"))

# dirichelet multinomial 
NewSensAnal(topic = "model",
           # names are based on new model
           object = c("Dirichlet Multinomial Length Comps"),
           author = "Haley Oleynik",
           folder_name = "Dirichlet_Multinomial",
           script_model = "Dirichlet_Multinomial_Analyses",
           script_results = "Dirichlet_Multinomial_Outputs",
           base_model = c("23.model.francis_2"),
           new_model = c("23.dmn"))


# Fecundity sensitivity analysis 
NewSensAnal(topic = "biological_Info",
            # names are based on new model
            object = c("Sensitivity to fecundity"),
            author = "Sabrina Beyer",
            folder_name = "Fecundity_Sensitivity",
            script_model = "Fecundity_Sensitivity_Analyses",
            script_results = "Fecundity_Sensitivity_Outputs",
            base_model = c("23.model.francis_2"),
            new_model = c("23.biology.no_fecundity"))


# ASHOP catches sensitivity analysis 
NewSensAnal(topic = "landings",
            # names are based on new model
            object = c("ASHOP Catches"),
            author = "Joshua Zahner",
            folder_name = "Landings_ashop",
            script_model = "Landings_ashop_Analyses",
            script_results = "Landings_ashop_Outputs",
            base_model = c("23.model.francis_2"),
            new_model = c("23.landings.ashop"))

NewSensAnal(
  topic = "model",
  object = c("Prelim DT - Low State", "Prelim DT - Base State", "Prelim DT - High State"),
  author = "Joshua Zahner",
  folder_name = "Initial_Decision_Table",
  script_model = "Initial_Decision_Table_Analyses",
  script_results = "Initial_Decision_Table_Results",
  base_model = c("23.model.francis_2", "23.model.francis_2", "23.model.francis_2"),
  new_model = c("23.decision.low", "23.decision.mid", "23.decision.high")
)

#NewSensAnal(topic = "surveys",
#            # names are based on new model
#            object = c("MB vs DB indices"),
#            author = "Andrea Odell",
#            folder_name = "surveys2_Sensitivity",
#            script_model = "surveys2_Sensitivity_Analyses",
#            script_results = "surveys2_Sensitivity_Outputs",
#            base_model = c("23.model.francis_2"),
#            new_model = c("23.surveys.db"))

# Add_Newmodel(SA_ID = "Item 1.1", new_model="23.landings.ashop2", base_model="23.model.francis_2", object = "Landings")
# 
# SOMEONE RUNS THESE MODELS! ASK JOSH FOR WHAT THESE SHOULD BE IF NOT CLEAR.
# Add_Newmodel(SA_ID = "Item 3.2", new_model="23.surveys.useslope", base_model="23.model.francis_2", object = "Surveys")
# Add_Newmodel(SA_ID = "Item 1.1", new_model="23.landings.4fleet", base_model="23.model.francis_2", object = "Landings")


# 4 survey structure sensitivity analysis
#NewSensAnal(topic = "surveys",
#            # names are based on new model
#            object = c("2 survey vs 4 survey structure", "extra SD on WCGBTS", "No Triennial Survey"),
#            author = "Andrea Odell",
#            folder_name = "surveys3_Sensitivity",
#            script_model = "surveys3_Sensitivity_Analyses",
#            script_results = "surveys3_Sensitivity_Outputs",
#            base_model = c("23.model.francis_2"),
#            new_model = c("23.surveys.useslope", "23.surveys.extaSDwcgbts", "23.surveys.notriennial"))

NewSensAnal(topic="landings", 
            object = "23.landings.4fleet", 
            author = "Adam Hayes",
            folder_name = "Landings_4fleet",
            script_model = "Landings_4fleet_Analyses",
            script_results = "Landings_4fleet_Outputs",
            base_model = c("23.model.francis_2"),
            new_model = c("23.landings.4fleet"))




# Sensitivity analyses for the STAR Panel
# ============================================================ #

# Request 3
# Provide two sensitivity runs with M=0.045 and M=0.05, reported in the format 
# requested in request #1. 
# Additionally, show the fits to survey indices and all length comps.
NewSensAnal(pool = "star_panel",
            topic="model", 
            author = "Matthieu VERON",
            folder_name = "Request_3",
            script_model = "Request_3_Analyses",
            script_results = "Request_3_Outputs",
            object = c("Fix M at 0.045", "Fix M at 0.05"), 
            base_model = c("23.model.francis_2"),
            new_model = c("23.STAR.Panel.M.045", "23.STAR.Panel.M.05"))

# Request 4
# Provide two sensitivity runs with M=0.045 and M=0.05, reported in the format 
# requested in request #1. 
# Additionally, show the fits to survey indices and all length comps.
NewSensAnal(pool = "star_panel",
            topic="model", 
            author = "P.Y. HERNVANN",
            folder_name = "Request_4",
            script_model = "Request_4_Analyses",
            script_results = "Request_4_Outputs",
            object = c("Estimate Maximum Retention"), 
            base_model = c("23.blkret.T3.blksel.T3"),
            new_model = c("23.est.max.ret"))


# length comp reweighting 
NewSensAnal(topic = "model",
            # names are based on new model
            object = c("Length Comp Re-weight"),
            author = "Andrea Odell",
            folder_name = "Length_Comp_Reweight",
            script_model = "Length_Comp_Reweight_Analyses",
            script_results = "Length_Comp_Reweight_Outputs",
            base_model = c("23.model.francis_2"),
            new_model = c("23.length.comp.reweight"))

NewSensAnal(topic = "model",
            # names are based on new model
            object = c("lenght comp combo only", "lenght comp add triennial", "lenght comp add NonTrawl", "lenght comp add SouthTrawl", "lenght comp add NorthTrawl"),
            author = "Andrea Odell",
            folder_name = "LenComp_Reweight_by_Fleet",
            script_model = "LenComp_Reweight_by_Fleet_Analyses",
            script_results = "LenComp_Reweight_by_Fleet_Outputs",
            base_model = c("23.model.francis_2","23.model.francis_2","23.model.francis_2","23.model.francis_2","23.model.francis_2"),
            new_model = c("23.lencomp.Combo.Only", "23.lencomp.AddTriennial", "23.lencomp.AddNonTrawl", "23.lencomp.AddSouthTrawl", "23.lencomp.AddNorthTrawl"))

NewSensAnal(
  pool="star_panel",
  topic="model", 
  author = "Joshua Zahner",
  folder_name = "Recruitment_Requests",
  script_model = "Recruitment_Requests_Analyses",
  script_results = "Recruitment_Requests_Outputs",
  object = c("Recuritment Bias Adustment", "New Recruitment Main Period"), 
  base_model = c("23.base.day2.update", "23.base.day2.update"),
  new_model = c("23.model.rec_biasadj", "23.model.rec_main_period")
)

NewSensAnal(
  pool="star_panel",
  topic="model", 
  author = "Joshua Zahner",
  folder_name = "Recruitment_Requests_2",
  script_model = "Recruitment_Requests_2_Analyses",
  script_results = "Recruitment_Requests_2_Outputs",
  object = c("New Recruitment Main Period Full"), 
  base_model = c("23.base.day2.update"),
  new_model = c("23.model.rec_long_main_period")
)

NewSensAnal(
  pool="star_panel",
  topic="model", 
  author = "Sabrina Beyer", 
  folder_name = "SigmaR_non_sum_to_zero",
  script_model = "SigmaR_non_sum_to_zero_Analyses",
  script_results = "SigmaR_non_sum_to_zero_Outputs",
  object = c("SigmaR_non_sum_to_zero"), 
  base_model = c("23.base.day2.update"),
  new_model = c("23.model.SigmaR.non.zero")
)

NewSensAnal(
  pool = "star_panel",
  topic = "model",
  author = "Team Thornyhead",
  folder_name = "STAR_base",
  script_model = "STAR_base_Analyses",
  script_results = "STAR_base_Outputs",
  object = c("STAR Approved Base Model"),
  base_model = c("23.model.rec_long_main_period"),
  new_model = c("23.STAR.base")
)

NewSensAnal(
  pool="star_panel",
  topic="model",
  author="Team Thornyhead",
  folder_name="STAR_decision_table_040",
  script_model="STAR_decision_table_040_Analyses",
  script_results="STAR_decision_table_040_Outputs",
  object=c("Low-State 040", "Base Case 040", "High-State 040"),
  base_model=c("23.STAR.base", "23.STAR.base", "23.STAR.base"),
  new_model=c("23.dt.low", "23.dt.base", "23.dt.high")
)

NewSensAnal(
  pool="star_panel",
  topic="model",
  author="Team Thornyhead",
  folder_name="STAR_decision_table_045",
  script_model="STAR_decision_table_045_Analyses",
  script_results="STAR_decision_table_045_Outputs",
  object=c("Low-State 045", "Base Case 045", "High-State 045"),
  base_model=c("23.STAR.base", "23.STAR.base", "23.STAR.base"),
  new_model=c("23.dt.low_045", "23.dt.base_045", "23.dt.high_045")
)

NewSensAnal(
  pool="base_model",
  topic="model",
  author="Team Thornyhead",
  folder_name = "Official_Base",
  script_model = "Official_Base_Analyses",
  script_results = "Official_Base_Outputs",
  object=c("Official Base"),
  base_model=c("23.STAR.base"),
  new_model =c("23.base.official")
)

NewSensAnal(
  pool="base_model",
  topic="model",
  author="Team Thornyhead",
  folder_name="Decision_Table_040",
  script_model="Base_dt_040_Analyses",
  script_results="Base_dt_040_Outputs",
  object=c("Base Case P*=0.40", "Low-State P*=0.40", "High-State P*=0.40"),
  base_model=c("23.base.official", "23.base.official", "23.base.official"),
  new_model=c("23.base.dt_base_40", "23.base.dt_low_40", "23.base.dt_high_40")
)

NewSensAnal(
  pool="base_model",
  topic="model",
  author="Team Thornyhead",
  folder_name="Decision_Table_045",
  script_model="Base_dt_045_Analyses",
  script_results="Base_dt_045_Outputs",
  object=c("Base Case P*=0.45", "Low-State P*=0.45", "High-State P*=0.45"),
  base_model=c("23.base.official", "23.base.official", "23.base.official"),
  new_model=c("23.base.dt_base_45", "23.base.dt_low_45", "23.base.dt_high_45")
)
