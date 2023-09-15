
#============ directory for output emission inp file (CBMZ) =============== 
export emisinpdir=/gpfs/home/hpc15zha/project/11_wrfchem_20211129/output/EmisUpdate_1/LongTermSim/2017/CBMZ_MEICV14/000_runscripts_for_github/emisinp_201707

#============== anthro emiss files processing ===========
# declare anthro_dir
# declare wrf_dir

export emisdir="'/gpfs/home/hpc15zha/project/11_wrfchem_20211129/DataForWRFchem/emis/2017_MEICV14/SAPRC99'"
export wrfdirforemis="'/gpfs/home/hpc15zha/project/11_wrfchem_20211129/wrf415srun/WRF/test/em_real'"
# year of emission
export emisfile_prefix="2017"

export emis_starttime="'2017-07-01_00:00:00'"
export emis_endtime="'2017-07-31_23:00:00'"

#============= emission output directory, wrfchemi for each sector ====================

export emisout=/gpfs/home/hpc15zha/project/11_wrfchem_20211129/output/EmisUpdate_1/LongTermSim/2017/CBMZ_MEICV14/emis/201707


#============ anthro emis directory ==========================================

export anthro_dir=/gpfs/home/hpc15zha/project/11_wrfchem_20211129/tools/ANTHRO/src

# no need to change everytime

#============== logdir =======================================================
export log_dir=/gpfs/home/hpc15zha/project/11_wrfchem_20211129/output/EmisUpdate_1/LongTermSim/2017/CBMZ_MEICV14/000_runscripts_for_github/logdir_201707
mkdir -p ${log_dir}

#==============  species mapping  =============================== 
# remember to change this
export empty_emis_dir='"/gpfs/home/hpc15zha/project/11_wrfchem_20211129/output/EmisUpdate_1/LongTermSim/2017/CBMZ_MEICV14/emis/201707/sectors/agr/"#'

# this is merged emission of whole sim. domain
export MOZART_emis_dir='"/gpfs/home/hpc15zha/project/11_wrfchem_20211129/output/EmisUpdate_1/LongTermSim/2017/MOZART_MEICV14/emis/201707/meic_edgarmerged/"#'

sed -i "1s,^,mozart_dir = ${MOZART_emis_dir}," ./03_20230915_mapping_MOZARTtoRADM2emis.py
sed -i "2s,^,wrfchemi_dir = ${empty_emis_dir}," ./03_20230915_mapping_MOZARTtoRADM2emis.py


