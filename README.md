# npTranscript_doc
## Documents for npTranscript

### run npTranscript
 example scripts were saved in scripts folder

### results
**Output files:**

There will be 8 output files, all the files were in gzip compress format

| file | Content |
| :-----: | :-----: |
| all.fa.gz | all reads, with mapping information |
| 3.fa.gz | information about 3' end (end) |
| 5.fa.gz | information about 5' end (start) | 
| splice.fa.gz | reads classified as splicing junction | 
| rem.fa.gz | part of reads that were not mapped to reference genome |
| join.fa.gz | fusion reads type as *join* |
| nogap.fa.gz | fusion reads type as *nogap* |
| overlap.fa.gz | fusion reads type as *overlap* |


**all.fa.gz**

| column | example | explaination |
| :---: | :---: | :---:|
| reads id | >029f0756-3c10-4376-981b-926037649f62 | reads id |
| chromesome | MT007544.1 or 1; 2 | chromesome the reads mapped to, if there are fusion, chromesome will be seperated by ; |
| 