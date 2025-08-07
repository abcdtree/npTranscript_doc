#!/bin/bash
#SBATCH --job-name=npTr_comb
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=32000 # mb
#SBATCH --time=100:00:00
#SBATCH --output=%x.%j.stdout
#SBATCH --error=%x.%j.stderr
#SBATCH --cpus-per-task=8

#EXAMPLE
#sh run_mm2.sh combined.fa test.fq test
#sbatch run_mm2.sh combined.fa test.fq test
module load minimap2/2.26
module load SAMtools/1.21
module load Java
export npTranscript=/data/gpfs/projects/punim1068/npTranscript_streaming
export JSA_MEM=12g
mainclass="npTranscript.run.ViralTranscriptAnalysisCmd2"
JSA_CP=${npTranscript}/java/target/npTranscript-1.0.jar:${npTranscript}/java/target/classes/
mainclass="npTranscript.run.ViralTranscriptAnalysisCmd2"
JSA_CP=${npTranscript}/java/target/npTranscript-1.0.jar:${npTranscript}/java/target/classes/

ref=$1
fastq=$2
output_folder=$3
echo $ref $fastq 1>&2

cd /output_home
mkdir -p /output_home/${output_folder}
##MAKE MMI
mmi=${ref}.mmi
if [ ! -s $mmi ];then
 echo "making index"
minimap2 -x splice  -d $mmi $ref
fi


echo $params 1>&2
#minimap2 -ax splice -un $mmi $fastq  > $fastq.bam
#java -Xmx${JSA_MEM} -ea -Djava.awt.headless=true -Dfile.encoding=UTF-8 -classpath ${JSA_CP} ${mainclass} $params

#GIVES JSON OUTPUT ON STDOUT
#minimap2  -ax splice -un -2 $mmi $fastq | java -Xmx${JSA_MEM} -ea -Djava.awt.headless=true -Dfile.encoding=UTF-8 -classpath ${JSA_CP} ${mainclass} $params > ${fastq}.json

##TO GET A TSV OUTPUT INSTEAD
params="--round=1   --breakThresh=30  --maxThreads=8 --RNA=true  --report=100 --sampleID=${fastq} --resDir=/output_home/${output_folder}"
minimap2  -ax splice -un -2 $mmi $fastq | java -Xmx${JSA_MEM} -ea -Djava.awt.headless=true -Dfile.encoding=UTF-8 -classpath ${JSA_CP} ${mainclass} $params 


