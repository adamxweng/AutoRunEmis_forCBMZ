

from netCDF4 import Dataset
import pandas as pd
import numpy as np
import os



filenames = os.listdir(wrfchemi_dir)
filenames = np.array(filenames)



#============== on 2022-10-28 ============================


# see:
# D:/UEA/research skill/wrf-chem/project_UEA/4_MOZART_2019large_testrun/777_important_note/species_mapping
# summary_MEIC_SPARC99_MOZART_toRADM2_20221028.xlsx
# also see:
# D:\UEA\research skill\wrf-chem\project_UEA\9_MOZART_mosaic_MEIC_lambert\1_scripts\actualRun_longTerm\2_CBMZ
# 02_20230915_IMPORTANT_github_making_autoEmis_autoRunscript.csh

for file in filenames:
    print("========  start  ==========")
    print(file)
    print("===========================")
    
    
    dsout = Dataset(wrfchemi_dir+file, "r+", format="NETCDF4_CLASSIC")  # reading and writing
    mozartdata = Dataset(mozart_dir+file)
    
    for i in np.arange(0,dsout['E_CO'].shape[1],1):
        
        
         dsout["E_CO"][:,i,:,:] = mozartdata["E_CO"][:,i,:,:]
         dsout["E_NO"][:,i,:,:] = mozartdata["E_NO"][:,i,:,:]
         dsout["E_NO2"][:,i,:,:] = mozartdata["E_NO2"][:,i,:,:]
         dsout["E_SO2"][:,i,:,:] = mozartdata["E_SO2"][:,i,:,:]
         dsout["E_NH3"][:,i,:,:] = mozartdata["E_NH3"][:,i,:,:]
         
         
         # for VOCs species, please see their emis_opt
         # 11 species
	 # make sure only species that can be processed by both mechanisms are kept
         
         dsout["E_ALD"][:,i,:,:] = mozartdata["E_CH3CHO"][:,i,:,:] #
         dsout["E_ETH"][:,i,:,:] = mozartdata["E_C2H6"][:,i,:,:] #
         dsout["E_HC3"][:,i,:,:] = mozartdata["E_C3H8"][:,i,:,:] #
         dsout["E_HC5"][:,i,:,:] = mozartdata["E_BIGALK"][:,i,:,:] #
         dsout["E_HCHO"][:,i,:,:] = mozartdata["E_CH2O"][:,i,:,:] #
         #dsout["E_ISO"][:,i,:,:] = mozartdata["E_ISOP"][:,i,:,:] # !!! iso is not processed in CBMZ, this is noticed when shutting down biogenic emisison
         dsout["E_KET"][:,i,:,:] = mozartdata["E_MEK"][:,i,:,:] +  mozartdata["E_CH3COCH3"][:,i,:,:] #
         #dsout["E_MGLY"][:,i,:,:] = mozartdata["E_MGLY"][:,i,:,:] # !!! mgly is not in emis_opt =3
         dsout["E_OL2"][:,i,:,:] = mozartdata["E_C2H4"][:,i,:,:] #
         #dsout["E_ORA2"][:,i,:,:] = mozartdata["E_CH3COOH"][:,i,:,:] !!!! this is missing from MOZART species file
         dsout["E_TOL"][:,i,:,:] = mozartdata["E_TOLUENE"][:,i,:,:] #
         dsout["E_XYL"][:,i,:,:] = mozartdata["E_XYLENE"][:,i,:,:] #
         
         
         dsout["E_OLI"][:,i,:,:] = mozartdata["E_BIGENE"][:,i,:,:] # bigene is Bigene: lumped alkenes C>3, while OLI in radm2 is Alkenes (Internal), according to Carter's table
         dsout["E_OLT"][:,i,:,:] = mozartdata["E_C3H6"][:,i,:,:] # C3H6 is propene, OLT is propene as well
         
         #dsout["E_CH4"][:,i,:,:]= mozartdata["E_CH4"][:,i,:,:] # not in emis_opt =10, shut down, not able to map to RADM2,
         #dsout["E_CSL"][:,i,:,:]= mozartdata["E_CRES"][:,i,:,:] # !*** in previous mapping, CRES to CSL, but CRES is not in emis_opt = 10
        
    
    
         dsout["E_ECI"][:,i,:,:] = mozartdata["E_ECI"][:,i,:,:]
         dsout["E_ECJ"][:,i,:,:] = mozartdata["E_ECJ"][:,i,:,:]
         dsout["E_ORGI"][:,i,:,:] = mozartdata["E_ORGI"][:,i,:,:]
         dsout["E_ORGJ"][:,i,:,:] = mozartdata["E_ORGJ"][:,i,:,:]
         dsout["E_PM25I"][:,i,:,:] = mozartdata["E_PM25I"][:,i,:,:]
         dsout["E_PM25J"][:,i,:,:] = mozartdata["E_PM25J"][:,i,:,:]
         dsout["E_PM_10"][:,i,:,:] = mozartdata["E_PM_10"][:,i,:,:]
         dsout["E_SO4I"][:,i,:,:] = mozartdata["E_SO4I"][:,i,:,:]
         dsout["E_SO4J"][:,i,:,:] = mozartdata["E_SO4J"][:,i,:,:]
         dsout["E_NO3I"][:,i,:,:] = mozartdata["E_NO3I"][:,i,:,:]
         dsout["E_NO3J"][:,i,:,:] = mozartdata["E_NO3J"][:,i,:,:]
         dsout["E_NO3J"][:,i,:,:] = mozartdata["E_NO3J"][:,i,:,:]
         dsout["E_NAAI"][:,i,:,:] = mozartdata["E_NAI"][:,i,:,:]
         dsout["E_NAAJ"][:,i,:,:] = mozartdata["E_NAJ"][:,i,:,:]
         dsout["E_CLI"][:,i,:,:] = mozartdata["E_CLI"][:,i,:,:]
         dsout["E_CLJ"][:,i,:,:] = mozartdata["E_CLJ"][:,i,:,:]
         dsout["E_ORGI_A"][:,i,:,:] = mozartdata["E_ORGI_A"][:,i,:,:]
         dsout["E_ORGJ_A"][:,i,:,:] = mozartdata["E_ORGJ_A"][:,i,:,:]
         dsout["E_ORGI_BB"][:,i,:,:] = mozartdata["E_ORGI_BB"][:,i,:,:]
         dsout["E_ORGJ_BB"][:,i,:,:] = mozartdata["E_ORGJ_BB"][:,i,:,:]
            
        
    
    
   
    
    
    
            
    
    dsout.close()
                
        
    
