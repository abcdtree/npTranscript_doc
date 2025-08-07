script_home=npTranscript_doc/scripts/run_mm2_npTranscript.sh

fastq_home=/fastq_home
for b in `ls ${fastq_home} | grep fastq | cut -f 1 -d . | uniq `
do
    fastq=/fastq_home/${b}.fastq.gz
    ref=/ref/ref.fasta

    sbatch ${script_home} ${ref} ${fastq} ${b}
done 
