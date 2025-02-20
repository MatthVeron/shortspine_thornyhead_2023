#V3.30
#C Controle file for Shortspine Thornyhead - 2023 Assessment
#C This is the the 2013 model updated control file for
#C transitionning the 2013 (SS V3.24) model to SS V3.30 format
#C Matthieu VERON - February 2023
#
0 # 0 means do not read wtatage.ss; 1 means read and usewtatage.ss and also read and use growth parameters
1 #_N_Growth_Patterns
1 #_N_platoons_Within_GrowthPattern
2 # recr_dist_method for parameters
1 # not yet implemented; Future usage:Spawner-Recruitment; 1=global; 2=by area
1 # number of recruitment settlement assignments 
0 # unused option
# for each settlement assignment:
#_GPattern	month	area	age
1	3	1	1	#_recr_dist_pattern1
#
#_Cond 0 # N_movement_definitions goes here if N_areas > 1
#_Cond 1.0 # first age that moves (real age at begin of season, not integer) also cond on do_migration>0
#_Cond 1 1 1 2 4 10 # example move definition for seas=1, morph=1, source=1 dest=2, age1=4, age2=10
#
3 #_Nblock_Patterns
2 2 1 #_blocks_per_pattern
#_begin and end years of blocks
2007 2010 2011 2022
2007 2010 2011 2022
2007 2022
#
# controls for all timevary parameters 
3 #_env/block/dev_adjust_method for all time-vary parms (1=warn relative to base parm bounds; 3=no bound check)
#
# AUTOGEN
1 1 1 1 1 # autogen: 1st element for biology, 2nd for SR, 3rd for Q, 4th reserved, 5th for selex
# where: 0 = autogen all time-varying parms; 1 = read each time-varying parm line; 2 = read then autogen if parm min==-12345
#
# setup for M, growth, maturity, fecundity, recruitment distibution, movement
#
1 #_natM_type:_0=1Parm; 1=N_breakpoints;_2=Lorenzen;_3=agespecific;_4=agespec_withseasinterpolate;_5=Maunder_M;_6=Age-range_Lorenzen
2 #_N_breakpoints
20 40 # age(real) at M breakpoints
1 # GrowthModel: 1=vonBert with L1&L2; 2=Richards with L1&L2; 3=age_specific_K_incr; 4=age_specific_K_decr;5=age_specific_K_each; 6=NA; 7=NA; 8=growth cessation
2 #_Age(post-settlement)_for_L1;linear growth below this
100 #_Growth_Age_for_L2 (999 to use as Linf)
-999 #_exponential decay for growth above maxage (value should approx initial Z; -999 replicates 3.24; -998 to not allow growth above maxage)
0 #_placeholder for future growth feature
#
0.1 #_SD_add_to_LAA (set to 0.1 for SS2 V1.x compatibility)
0 #_CV_Growth_Pattern:  0 CV=f(LAA); 1 CV=F(A); 2 SD=F(LAA); 3 SD=F(A); 4 logSD=F(A)
1 #_maturity_option:  1=length logistic; 2=age logistic; 3=read age-maturity matrix by growth_pattern; 4=read age-fecundity; 5=disabled; 6=read length-maturity
1 #_First_Mature_Age
1 #_fecundity option:(1)eggs=Wt*(a+b*Wt);(2)eggs=a*L^b;(3)eggs=a*Wt^b; (4)eggs=a+b*L; (5)eggs=a+b*W
0 #_hermaphroditism option:  0=none; 1=female-to-male age-specific fxn; -1=male-to-female age-specific fxn
3 #_parameter_offset_approach (1=none, 2= M, G, CV_G as offset from female-GP1, 3=like SS2 V1.x)
#
#_growth_parms
#_LO	HI	INIT	PRIOR	PR_SD	PR_type	PHASE	env_var&link	dev_link	dev_minyr	dev_maxyr	dev_PH	Block	Block_Fxn
 0.01	0.15	     0.0505	-3.129	0.5361	3	 -3	0	0	0	0	0	0	0	#_NatM_p_1_Fem_GP_1  
   -3	   3	          0	     0	   0.2	0	 -3	0	0	0	0	0	0	0	#_NatM_p_2_Fem_GP_1  
    3	  10	          7	     9	     2	0	 -2	0	0	0	0	0	0	0	#_L_at_Amin_Fem_GP_1 
   55	  95	         75	    70	     5	0	 -2	0	0	0	0	0	0	0	#_L_at_Amax_Fem_GP_1 
 0.01	0.03	      0.018	 0.017	   0.8	0	 -3	0	0	0	0	0	0	0	#_VonBert_K_Fem_GP_1 
 0.05	0.25	      0.125	   0.1	   0.8	0	 -3	0	0	0	0	0	0	0	#_CV_young_Fem_GP_1  
   -3	   3	          0	     0	   0.8	0	 -3	0	0	0	0	0	0	0	#_CV_old_Fem_GP_1    
    0	 100	4.77065e-06	     0	   0.8	0	 -3	0	0	0	0	0	0	0	#_Wtlen_1_Fem_GP_1   
    0	 100	    3.26298	     0	   0.8	0	 -3	0	0	0	0	0	0	0	#_Wtlen_2_Fem_GP_1   
    0	 100	       18.2	    22	   0.8	0	 -3	0	0	0	0	0	0	0	#_Mat50%_Fem_GP_1    
   -3	 100	       -2.3	  -0.4	   0.8	0	 -3	0	0	0	0	0	0	0	#_Mat_slope_Fem_GP_1 
    0	 100	          1	     1	   0.8	0	 -3	0	0	0	0	0	0	0	#_Eggs_alpha_Fem_GP_1
    0	 100	          0	     0	   0.8	0	 -3	0	0	0	0	0	0	0	#_Eggs_beta_Fem_GP_1 
   -3	   3	          0	     0	   0.8	0	 -3	0	0	0	0	0	0	0	#_NatM_p_1_Mal_GP_1  
   -3	   3	          0	     0	   0.8	0	 -3	0	0	0	0	0	0	0	#_NatM_p_2_Mal_GP_1  
   -3	   3	          0	     0	   0.8	0	 -3	0	0	0	0	0	0	0	#_L_at_Amin_Mal_GP_1 
   -3	   3	   -0.10536	  -0.1	   0.8	0	 -2	0	0	0	0	0	0	0	#_L_at_Amax_Mal_GP_1 
   -3	   3	          0	     0	   0.8	0	 -3	0	0	0	0	0	0	0	#_VonBert_K_Mal_GP_1 
   -3	   3	          0	     0	   0.8	0	 -3	0	0	0	0	0	0	0	#_CV_young_Mal_GP_1  
   -3	   3	          0	     0	   0.8	0	 -3	0	0	0	0	0	0	0	#_CV_old_Mal_GP_1    
    0	 100	4.77065e-06	     0	   0.8	0	 -3	0	0	0	0	0	0	0	#_Wtlen_1_Mal_GP_1   
    0	 100	    3.26298	     0	   0.8	0	 -3	0	0	0	0	0	0	0	#_Wtlen_2_Mal_GP_1   
    0	   0	          0	     0	     0	0	 -4	0	0	0	0	0	0	0	#_RecrDist_GP_1      
    0	   0	          0	     0	     0	0	 -4	0	0	0	0	0	0	0	#_RecrDist_Area_1    
    0	   0	          0	     0	     0	0	 -4	0	0	0	0	0	0	0	#_RecrDist_month_1   
    0	   0	          0	     0	     0	0	 -4	0	0	0	0	0	0	0	#_CohortGrowDev      
1e-08	   1	        0.5	   0.5	   0.5	0	-99	0	0	0	0	0	0	0	#_FracFemale_GP_1    
#_no timevary MG parameters
#
#_seasonal_effects_on_biology_parms
0 0 0 0 0 0 0 0 0 0 #_femwtlen1,femwtlen2,mat1,mat2,fec1,fec2,Malewtlen1,malewtlen2,L1,K
#_ LO HI INIT PRIOR PR_SD PR_type PHASE
#_Cond -2 2 0 0 -1 99 -2 #_placeholder when no seasonal MG parameters
#
3 #_Spawner-Recruitment; 2=Ricker; 3=std_B-H; 4=SCAA;5=Hockey; 6=B-H_flattop; 7=survival_3Parm;8=Shepard_3Parm
0 # 0/1 to use steepness in initial equ recruitment calculation
0 # future feature: 0/1 to make realized sigmaR a function of SR curvature
#_LO	HI	INIT	PRIOR	PR_SD	PR_type	PHASE	env-var	use_dev	dev_mnyr	dev_mxyr	dev_PH	Block	Blk_Fxn # parm_name
  7	13	10.3	   10	   10	0	 4	0	0	0	0	0	0	0	#_SR_LN(R0)  
0.2	 1	 0.6	0.779	0.152	0	-2	0	0	0	0	0	0	0	#_SR_BH_steep
  0	 2	 0.5	  0.5	  0.8	0	-4	0	0	0	0	0	0	0	#_SR_sigmaR  
 -5	 5	   0	    0	    1	0	-4	0	0	0	0	0	0	0	#_SR_regime  
 -1	 1	   0	    0	  100	0	-1	0	0	0	0	0	0	0	#_SR_autocorr
#_no timevary SR parameters
1 #do_recdev:  0=none; 1=devvector (R=F(SSB)+dev); 2=deviations (R=F(SSB)+dev); 3=deviations (R=R0*dev; dev2=R-f(SSB)); 4=like 3 with sum(dev2) adding penalty
1850 # first year of main recr_devs; early devs can preceed this era
2012 # last year of main recr_devs; forecast devs start in following year
6 #_recdev phase
1 # (0/1) to read 13 advanced options
0 #_recdev_early_start (0=none; neg value makes relative to recdev_start)
-4 #_recdev_early_phase
5 #_forecast_recruitment phase (incl. late recr) (0 value resets to maxphase+1)
1 #_lambda for Fcast_recr_like occurring before endyr+1
1859.5 #_last_yr_nobias_adj_in_MPD; begin of ramp
1918.4 #_first_yr_fullbias_adj_in_MPD; begin of plateau
2010.7 #_last_yr_fullbias_adj_in_MPD
2012.1 #_end_yr_for_ramp_in_MPD (can be in forecast to shape ramp, but SS sets bias_adj to 0.0 for fcast yrs)
0.072 #_max_bias_adj_in_MPD (-1 to override ramp and set biasadj=1.0 for all estimated recdevs)
0 #_period of cycles in recruitment (N parms read below)
-5 #min rec_dev
5 #max rec_dev
0 #_read_recdevs
#_end of advanced SR options
#
#_placeholder for full parameter lines for recruitment cycles
# read specified recr devs
#_Yr Input_value
#
#Fishing Mortality info
0.06 # F ballpark
1999 # F ballpark year (neg value to disable)
1 # F_Method:  1=Pope; 2=instan. F; 3=hybrid (hybrid is recommended)
0.9 # max F or harvest rate, depends on F_Method
#
#_initial_F_parms; count = 0
#
#_Q_setup for fleets with cpue or survey data
#_fleet	link	link_info	extra_se	biasadj	float  #  fleetname
    5	1	0	1	0	1	#_Triennial1
    6	1	0	0	0	1	#_Triennial2
    7	1	0	0	0	1	#_AFSCslope 
    8	1	0	0	0	1	#_NWFSCslope
    9	1	0	0	0	1	#_NWFSCcombo
-9999	0	0	0	0	0	#_terminator
#_Q_parms(if_any);Qunits_are_ln(q)
#_LO	HI	INIT	PRIOR	PR_SD	PR_type	PHASE	env-var	use_dev	dev_mnyr	dev_mxyr	dev_PH	Block	Blk_Fxn  #  parm_name
  -5	  5	-2	   0	  1	0	-1	0	0	0	0	0	0	0	#_LnQ_base_Triennial1(5) 
0.01	0.5	 0	0.05	0.1	0	 4	0	0	0	0	0	0	0	#_Q_extraSD_Triennial1(5)
  -5	  5	-2	   0	  1	0	-1	0	0	0	0	0	0	0	#_LnQ_base_Triennial2(6) 
  -5	  5	 0	   0	  1	0	-1	0	0	0	0	0	0	0	#_LnQ_base_AFSCslope(7)  
  -5	  5	-1	   0	  1	0	-1	0	0	0	0	0	0	0	#_LnQ_base_NWFSCslope(8) 
  -5	  5	-5	   0	  1	0	-1	0	0	0	0	0	0	0	#_LnQ_base_NWFSCcombo(9) 
#_no timevary Q parameters
#
#_size_selex_patterns
#_Pattern	Discard	Male	Special
24	1	0	0	#_1 Trawl_N    
24	1	0	0	#_2 Trawl_S    
24	1	0	0	#_3 Non-trawl_N
24	1	0	0	#_4 Non-trawl_S
24	0	0	0	#_5 Triennial1 
24	0	0	0	#_6 Triennial2 
24	0	0	0	#_7 AFSCslope  
24	0	0	0	#_8 NWFSCslope 
24	0	0	0	#_9 NWFSCcombo 
#
#_age_selex_patterns
#_Pattern	Discard	Male	Special
10	0	0	0	#_1 Trawl_N    
10	0	0	0	#_2 Trawl_S    
10	0	0	0	#_3 Non-trawl_N
10	0	0	0	#_4 Non-trawl_S
10	0	0	0	#_5 Triennial1 
10	0	0	0	#_6 Triennial2 
10	0	0	0	#_7 AFSCslope  
10	0	0	0	#_8 NWFSCslope 
10	0	0	0	#_9 NWFSCcombo 
#
#_SizeSelex
#_LO	HI	INIT	PRIOR	PR_SD	PR_type	PHASE	env-var	use_dev	dev_mnyr	dev_mxyr	dev_PH	Block	Blk_Fxn  #  parm_name
   10	60	  30	  30	 5	0	  1	0	0	0	0	0	0	0	#_SizeSel_P_1_Trawl_N(1)       
   -7	 7	   0	-0.5	 2	0	  3	0	0	0	0	0	0	0	#_SizeSel_P_2_Trawl_N(1)       
   -5	10	   3	1.75	 5	0	  3	0	0	0	0	0	0	0	#_SizeSel_P_3_Trawl_N(1)       
   -5	10	   5	 0.1	 2	0	  4	0	0	0	0	0	0	0	#_SizeSel_P_4_Trawl_N(1)       
 -999	15	-999	   0	 5	0	-99	0	0	0	0	0	0	0	#_SizeSel_P_5_Trawl_N(1)       
 -999	15	-999	   0	 5	0	-99	0	0	0	0	0	0	0	#_SizeSel_P_6_Trawl_N(1)       
    5	70	  23	  27	99	0	  3	0	0	0	0	0	1	3	#_SizeSel_PRet_1_Trawl_N(1)    
  0.1	40	   2	  15	99	0	  3	0	0	0	0	0	0	0	#_SizeSel_PRet_2_Trawl_N(1)    
1e-04	 1	 0.9	 0.9	99	0	  3	0	0	0	0	0	1	3	#_SizeSel_PRet_3_Trawl_N(1)    
   -3	 3	   0	   0	 3	0	 -4	0	0	0	0	0	0	0	#_SizeSel_PRet_4_Trawl_N(1)    
   10	60	  30	  30	 5	0	  1	0	0	0	0	0	0	0	#_SizeSel_P_1_Trawl_S(2)       
   -7	 7	   0	-0.5	 2	0	  3	0	0	0	0	0	0	0	#_SizeSel_P_2_Trawl_S(2)       
   -5	10	   3	1.75	 5	0	  3	0	0	0	0	0	0	0	#_SizeSel_P_3_Trawl_S(2)       
   -5	10	   5	 0.1	 2	0	  4	0	0	0	0	0	0	0	#_SizeSel_P_4_Trawl_S(2)       
 -999	15	-999	   0	 5	0	-99	0	0	0	0	0	0	0	#_SizeSel_P_5_Trawl_S(2)       
 -999	15	-999	   0	 5	0	-99	0	0	0	0	0	0	0	#_SizeSel_P_6_Trawl_S(2)       
    5	70	  23	  27	99	0	  3	0	0	0	0	0	2	3	#_SizeSel_PRet_1_Trawl_S(2)    
  0.1	40	   2	  15	99	0	  3	0	0	0	0	0	0	0	#_SizeSel_PRet_2_Trawl_S(2)    
1e-04	 1	 0.9	 0.9	99	0	  3	0	0	0	0	0	2	3	#_SizeSel_PRet_3_Trawl_S(2)    
   -3	 3	   0	   0	 3	0	 -4	0	0	0	0	0	0	0	#_SizeSel_PRet_4_Trawl_S(2)    
   10	60	  30	  30	 5	0	  2	0	0	0	0	0	0	0	#_SizeSel_P_1_Non-trawl_N(3)   
   -7	 7	   0	-0.5	 2	0	  3	0	0	0	0	0	0	0	#_SizeSel_P_2_Non-trawl_N(3)   
   -5	10	   3	1.75	 5	0	  3	0	0	0	0	0	0	0	#_SizeSel_P_3_Non-trawl_N(3)   
   -5	10	   5	 0.1	 2	0	  4	0	0	0	0	0	0	0	#_SizeSel_P_4_Non-trawl_N(3)   
 -999	15	-999	   0	 5	0	-99	0	0	0	0	0	0	0	#_SizeSel_P_5_Non-trawl_N(3)   
 -999	15	-999	   0	 5	0	-99	0	0	0	0	0	0	0	#_SizeSel_P_6_Non-trawl_N(3)   
    5	70	  23	  27	99	0	  3	0	0	0	0	0	0	0	#_SizeSel_PRet_1_Non-trawl_N(3)
  0.1	40	   2	  15	99	0	  3	0	0	0	0	0	0	0	#_SizeSel_PRet_2_Non-trawl_N(3)
1e-04	 1	 0.9	 0.9	99	0	  3	0	0	0	0	0	0	0	#_SizeSel_PRet_3_Non-trawl_N(3)
   -3	 3	   0	   0	 3	0	 -4	0	0	0	0	0	0	0	#_SizeSel_PRet_4_Non-trawl_N(3)
   10	60	  30	  30	 5	0	  2	0	0	0	0	0	0	0	#_SizeSel_P_1_Non-trawl_S(4)   
   -7	 7	   0	-0.5	 2	0	  3	0	0	0	0	0	0	0	#_SizeSel_P_2_Non-trawl_S(4)   
   -5	10	   3	1.75	 5	0	  3	0	0	0	0	0	0	0	#_SizeSel_P_3_Non-trawl_S(4)   
   -5	10	   5	 0.1	 2	0	  4	0	0	0	0	0	0	0	#_SizeSel_P_4_Non-trawl_S(4)   
 -999	15	-999	   0	 5	0	-99	0	0	0	0	0	0	0	#_SizeSel_P_5_Non-trawl_S(4)   
 -999	15	-999	   0	 5	0	-99	0	0	0	0	0	0	0	#_SizeSel_P_6_Non-trawl_S(4)   
    5	70	  23	  27	99	0	  3	0	0	0	0	0	3	3	#_SizeSel_PRet_1_Non-trawl_S(4)
  0.1	40	   2	  15	99	0	  3	0	0	0	0	0	0	0	#_SizeSel_PRet_2_Non-trawl_S(4)
1e-04	 1	 0.9	 0.9	99	0	  3	0	0	0	0	0	3	3	#_SizeSel_PRet_3_Non-trawl_S(4)
   -3	 3	   0	   0	 3	0	 -4	0	0	0	0	0	0	0	#_SizeSel_PRet_4_Non-trawl_S(4)
   10	60	  30	  30	 5	0	  2	0	0	0	0	0	0	0	#_SizeSel_P_1_Triennial1(5)    
   -7	 7	  -7	-0.5	 2	0	  3	0	0	0	0	0	0	0	#_SizeSel_P_2_Triennial1(5)    
   -5	10	   3	1.75	 5	0	  3	0	0	0	0	0	0	0	#_SizeSel_P_3_Triennial1(5)    
   -5	10	   5	 0.1	 2	0	  4	0	0	0	0	0	0	0	#_SizeSel_P_4_Triennial1(5)    
 -999	15	-999	   0	 5	0	-99	0	0	0	0	0	0	0	#_SizeSel_P_5_Triennial1(5)    
 -999	15	-999	   0	 5	0	-99	0	0	0	0	0	0	0	#_SizeSel_P_6_Triennial1(5)    
   10	60	  30	  30	 5	0	  2	0	0	0	0	0	0	0	#_SizeSel_P_1_Triennial2(6)    
   -7	 7	   0	-0.5	 2	0	  3	0	0	0	0	0	0	0	#_SizeSel_P_2_Triennial2(6)    
   -5	10	   3	1.75	 5	0	  3	0	0	0	0	0	0	0	#_SizeSel_P_3_Triennial2(6)    
   -5	10	   5	 0.1	 2	0	  4	0	0	0	0	0	0	0	#_SizeSel_P_4_Triennial2(6)    
 -999	15	-999	   0	 5	0	-99	0	0	0	0	0	0	0	#_SizeSel_P_5_Triennial2(6)    
 -999	15	-999	   0	 5	0	-99	0	0	0	0	0	0	0	#_SizeSel_P_6_Triennial2(6)    
   10	60	  30	  30	 5	0	  2	0	0	0	0	0	0	0	#_SizeSel_P_1_AFSCslope(7)     
   -7	 7	  -7	-0.5	 2	0	  3	0	0	0	0	0	0	0	#_SizeSel_P_2_AFSCslope(7)     
   -5	10	   3	1.75	 5	0	  3	0	0	0	0	0	0	0	#_SizeSel_P_3_AFSCslope(7)     
   -5	10	   5	 0.1	 2	0	  4	0	0	0	0	0	0	0	#_SizeSel_P_4_AFSCslope(7)     
 -999	15	-999	   0	 5	0	-99	0	0	0	0	0	0	0	#_SizeSel_P_5_AFSCslope(7)     
 -999	15	-999	   0	 5	0	-99	0	0	0	0	0	0	0	#_SizeSel_P_6_AFSCslope(7)     
   10	60	  30	  30	 5	0	  2	0	0	0	0	0	0	0	#_SizeSel_P_1_NWFSCslope(8)    
   -7	 7	   0	-0.5	 2	0	  3	0	0	0	0	0	0	0	#_SizeSel_P_2_NWFSCslope(8)    
   -5	10	   3	1.75	 5	0	  3	0	0	0	0	0	0	0	#_SizeSel_P_3_NWFSCslope(8)    
   -5	10	   5	 0.1	 2	0	  4	0	0	0	0	0	0	0	#_SizeSel_P_4_NWFSCslope(8)    
 -999	15	-999	   0	 5	0	-99	0	0	0	0	0	0	0	#_SizeSel_P_5_NWFSCslope(8)    
 -999	15	-999	   0	 5	0	-99	0	0	0	0	0	0	0	#_SizeSel_P_6_NWFSCslope(8)    
   10	60	  30	  30	 5	0	  2	0	0	0	0	0	0	0	#_SizeSel_P_1_NWFSCcombo(9)    
   -7	 7	   0	-0.5	 2	0	  3	0	0	0	0	0	0	0	#_SizeSel_P_2_NWFSCcombo(9)    
   -5	10	   3	1.75	 5	0	  3	0	0	0	0	0	0	0	#_SizeSel_P_3_NWFSCcombo(9)    
   -5	10	   5	 0.1	 2	0	  4	0	0	0	0	0	0	0	#_SizeSel_P_4_NWFSCcombo(9)    
 -999	15	-999	   0	 5	0	-99	0	0	0	0	0	0	0	#_SizeSel_P_5_NWFSCcombo(9)    
 -999	15	-999	   0	 5	0	-99	0	0	0	0	0	0	0	#_SizeSel_P_6_NWFSCcombo(9)    
#_AgeSelex
#_No age_selex_parm
# timevary selex parameters 
#_LO	HI	INIT	PRIOR	PR_SD	PR_type	PHASE
 -10	 10	0	0	  5	6	4	#_SizeSel_PRet_1_Trawl_N(1)_BLK1delta_2007    
 -10	 10	0	0	  5	6	4	#_SizeSel_PRet_1_Trawl_N(1)_BLK1delta_2011    
-0.5	0.5	0	0	0.2	6	4	#_SizeSel_PRet_3_Trawl_N(1)_BLK1delta_2007    
-0.5	0.5	0	0	0.2	6	4	#_SizeSel_PRet_3_Trawl_N(1)_BLK1delta_2011    
 -10	 10	0	0	  5	6	4	#_SizeSel_PRet_1_Trawl_S(2)_BLK2delta_2007    
 -10	 10	0	0	  5	6	4	#_SizeSel_PRet_1_Trawl_S(2)_BLK2delta_2011    
-0.5	0.5	0	0	0.2	6	4	#_SizeSel_PRet_3_Trawl_S(2)_BLK2delta_2007    
-0.5	0.5	0	0	0.2	6	4	#_SizeSel_PRet_3_Trawl_S(2)_BLK2delta_2011    
 -10	 10	0	0	  5	6	4	#_SizeSel_PRet_1_Non-trawl_S(4)_BLK3delta_2007
-0.5	0.5	0	0	0.2	6	4	#_SizeSel_PRet_3_Non-trawl_S(4)_BLK3delta_2007
# info on dev vectors created for selex parms are reported with other devs after tag parameter section
#
0 #  use 2D_AR1 selectivity(0/1):  experimental feature
#_no 2D_AR1 selex offset used
# Tag loss and Tag reporting parameters go next
0 # TG_custom:  0=no read; 1=read if tags exist
#_Cond -6 6 1 1 2 0.01 -4 0 0 0 0 0 0 0  #_placeholder if no parameters
#
# Input variance adjustments factors: 
#_Data_type	Fleet	Value
    4	1	0.5595	#_Variance_adjustment_list1 
    4	2	0.9773	#_Variance_adjustment_list2 
    4	3	0.5422	#_Variance_adjustment_list3 
    4	4	0.4024	#_Variance_adjustment_list4 
    4	5	0.6812	#_Variance_adjustment_list5 
    4	6	0.6494	#_Variance_adjustment_list6 
    4	7	     1	#_Variance_adjustment_list7 
    4	8	0.5126	#_Variance_adjustment_list8 
    4	9	     1	#_Variance_adjustment_list9 
    5	1	     1	#_Variance_adjustment_list10
    5	2	     1	#_Variance_adjustment_list11
    5	3	     1	#_Variance_adjustment_list12
    5	4	     1	#_Variance_adjustment_list13
    5	5	     1	#_Variance_adjustment_list14
    5	6	     1	#_Variance_adjustment_list15
    5	7	     1	#_Variance_adjustment_list16
    5	8	     1	#_Variance_adjustment_list17
    5	9	     1	#_Variance_adjustment_list18
    6	1	     1	#_Variance_adjustment_list19
    6	2	     1	#_Variance_adjustment_list20
    6	3	     1	#_Variance_adjustment_list21
    6	4	     1	#_Variance_adjustment_list22
    6	5	     1	#_Variance_adjustment_list23
    6	6	     1	#_Variance_adjustment_list24
    6	7	     1	#_Variance_adjustment_list25
    6	8	     1	#_Variance_adjustment_list26
    6	9	     1	#_Variance_adjustment_list27
-9999	0	     0	#_terminator                
#
5 #_maxlambdaphase
1 #_sd_offset; must be 1 if any growthCV, sigmaR, or survey extraSD is an estimated parameter
# read 3 changes to default Lambdas (default value is 1.0)
#_like_comp	fleet	phase	value	sizefreq_method
   17	999	2	 0.1	999	#_F-ballpark_NA_Phz2
   17	999	3	0.01	999	#_F-ballpark_NA_Phz3
   17	999	5	   0	999	#_F-ballpark_NA_Phz5
-9999	  0	0	   0	  0	#_terminator        
#
0 # 0/1 read specs for more stddev reporting
#
999
