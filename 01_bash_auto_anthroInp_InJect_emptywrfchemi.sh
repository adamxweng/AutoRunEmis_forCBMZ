trash()
    {
    mv $@ /gpfs/home/hpc15zha/trashcan
    }

cleartrash()
    {
    read -p "clear sure?[n]" confirm
    [ $confirm == 'y' ] || [ $confirm == 'Y' ]  && /bin/rm -rf /gpfs/home/hpc15zha/trashcan/*
    }
	


mkdir -p ${emisinpdir}

trash ${emisinpdir}/*

cat > ${emisinpdir}/agr.inp <<EOF
&CONTROL



 src_file_suffix = '.nc'
 src_names = 'BC(1)','GLY(1)','MVK(1)','MEK(1)','PRD2(1)','MACR(1)',
            'MGLY(1)','ALK1(1)','ALK2(1)','ALK3(1)','ALK4(1)',
            'ALK5(1)','ARO1(1)','ARO2(1)','OLE1(1)',
            'OLE2(1)','ETHE(1)','HCHO(1)','CCHO(1)','ACET(1)',
            'MEOH(1)','ISOP(1)','TERP(1)','BALD(1)','CH4(1)',
                        'CRES(1)','PHEN(1)',
            'CO(28)','NH3(17)','NO(30)','NO2(46)','OC(1)','PM25(1)','PM10(1)','SO2(64)',
 sub_categories  = 'emis_tot'
 cat_var_prefix  = ' '
 serial_output   = .false.


 emissions_zdim_stag = 8
 emis_map = 'CO->0.0*CO',
			'NO->0.0*CO',
			'NO2->0.0*CO',
			'SO2->0.0*CO',
			'NH3->0.0*CO',
            !!! orginally from D:\UEA\research skill\wrf-chem\project_UEA\9_MOZART_mosaic_MEIC_lambert\2_namelist\CBMZ_all_namelist\anthro\2017July\MEIC
            'ALD->0.0*CO',
	    !'CH4->0.0*CO',
            !'CSL->0.0*CO',!*** in previous mapping, CRES to CSL, but CRES is not in emis_opt = 10
            'ETH->0.0*CO',
            'HC3->0.0*CO',
            'HC5->0.0*CO',
            !'HC8->0.0*CO',
            'HCHO->0.0*CO',
            !'ISO->0.0*CO',!!*** ISO is not actually read in CBMZ!!
            'KET->0.0*CO',
            !'MGLY->0.0*CO',!!*** emis_opt =3 has no MGLY
            'OL2->0.0*CO',
            'OLI->0.0*CO',
            'OLT->0.0*CO',
            !'ORA1->0.0*CO',!! not in MOZART, this is Formic acid
            !'ORA2->0.0*CO',!!** not in MOZART, this is organic acid
            'TOL->0.0*CO',
            'XYL->0.0*CO',
            'ECI(a)->0.0*CO','ECJ(a)->0.0*CO','ORGI(a)->0.0*CO','ORGJ(a)->0.0*CO',
			'PM25I(a)->0.0*CO',
            'PM25J(a)->0.0*CO',
			'PM_10(a)->0.0*CO',
			'SO4I(a)->0.0*PM10','SO4J(a)->0.0*PM10',
			'NO3I(a)->0.0*PM10',
            'NO3J(a)->0.0*PM10','NAAI(a)->0.0*PM10','NAAJ(a)->0.0*PM10',
            'CLI(a)->0.0*PM10','CLJ(a)->0.0*PM10','ORGI_A(a)->0.0*PM10','ORGJ_A(a)->0.0*PM10',
            'ORGI_BB(a)->0.0*PM10','ORGJ_BB(a)->0.0*PM10'
/
EOF


#========= agriculture =============

sed -i "2s,^, anthro_dir = ${emisdir}," ${emisinpdir}/agr.inp
sed -i "3s,^, wrf_dir    = ${wrfdirforemis}," ${emisinpdir}/agr.inp
sed -i "4s,^, src_file_prefix = \'${emisfile_prefix}_agriculture_\'," ${emisinpdir}/agr.inp
sed -i "16s,^, start_output_time = ${emis_starttime}," ${emisinpdir}/agr.inp
sed -i "17s,^, stop_output_time = ${emis_endtime}," ${emisinpdir}/agr.inp

