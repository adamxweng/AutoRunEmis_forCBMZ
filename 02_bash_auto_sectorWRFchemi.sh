mkdir -p ${emisout}

mkdir -p ${emisout}/sectors
#mkdir -p ${emisout}/sectors/indus
#mkdir -p ${emisout}/sectors/power
#mkdir -p ${emisout}/sectors/res
#mkdir -p ${emisout}/sectors/trans
mkdir -p ${emisout}/sectors/agr




srcID=( agriculture ) 
filedir=( agr )


for i in 0
do
        export MEICSource=${srcID[$i]}
        echo $MEICSource
        export outdir=${filedir[$i]}
        echo $outdir
        ${anthro_dir}/anthro_emis < ${emisinpdir}/${outdir}.inp >> ${log_dir}/${outdir}_anthroEmisRun.log && mv ./wrfchemi* ${emisout}/sectors/${outdir} && tail -30 ${log_dir}/${outdir}_anthroEmisRun.log


done
