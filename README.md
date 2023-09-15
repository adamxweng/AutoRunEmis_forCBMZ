# AutoEmiss processing for CBMZ
Species are directly mapped from MOZART emissions.
I only keep species that can be read and processed by both CBMZ and MOZART.

# how to run:
source 00_envVriables_settingEmis_git.sh
source ~/.bash_profile
bash 01_bash_auto_anthroInp_InJect_emptywrfchemi.sh && bash 02_bash_auto_sectorWRFchemi.sh
module add python/anaconda/2019.10/3.7
conda activate wrfchemi
python3 03_20230915_mapping_MOZARTtoRADM2emis.py
bash 04_move_wrfchemi.sh
