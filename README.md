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

| column | example | explanation |
| :---: | :---: | :---:|
| reads id | >029f0756-3c10-4376-981b-926037649f62 | reads id |
| chromesome | MT007544.1 or 1; 2 | chromesome the reads mapped to, if there are fusion, chromesome will be seperated by ; |
| strand | + or +;- | strand for each part of the mapping reads on the chromesome showing in chromesome column |
| start | 43021084 or 367;16569 | start position on each mapped chromesome |
| chunk on chromesome | 1_6,8_200;230_1,590_235,1000_600 | **,** seperate chunks on the same chromesome, **;** seperate different chromesomes |  
| mapping score | 60 or 60;60 | mapping scores for reads to each chromesome |
| mapping rate | 15.0 or 15.0;22.0 | another scores |
| chunk on reads | 2168_114,113_1;2737_2625,2624_2498,2497_2305 | corresponding positions on reads to chunk on chromesome |
| overlap | -136 or 3 | the overlap length on reads between the two chromesomes reads aligned |
| seq | CTGACTTTGACC... | raw sequence |


**3.fa.gz**

| column | example | explanation | 
| :---: | :---: | :---:|
| reads id | >029f0756-3c10-4376-981b-926037649f62 | reads id |
| cnt | cnt:4 | no idea |
| S+ | S+ | no idea |
| chromesome | 16 | chromesome the 3' part aligned to |
| start | 79211603 | start position on the chromesome |
| seq | GCTAACCGGA | last 10 bp |
| seq_short | CCGGA | last 5 bp |

**5.fa.gz**

| column | example | explanation | 
| :---: | :---: | :---:|
| reads id | >029f0756-3c10-4376-981b-926037649f62 | reads id |
| cnt | cnt:4 | no idea |
| strand | S+ or S-| Strand |
| chromesome | 16 | chromesome the 5' part aligned to |
| start | 79211603 | start position on the chromesome |
| seq | GCTAACCGGA | first 10 bp |
| seq_short | CCGGA | first 5 bp |

**splice.fa.gz**

| column | example | explanation | 
| :---: | :---: | :---:|
| reads id | >029f0756-3c10-4376-981b-926037649f62 | reads id |
| cnt | cnt:4 | no idea |
| strand | S+ or S- | strand |
| chromesome | 16 | chromesome the 5' part aligned to |
| start | 79211603 | start position on the chromesome |
| start-end | 175-176 | start to end position on the reads |
| seq | TCGAGG | central 6 bp |
| seq_short | CGAG | central 4 bp |

**rem.fa.gz**
| column | example | explanation | 
| :---: | :---: | :---:|
| reads id | >029f0756-3c10-4376-981b-926037649f62 | reads id |
| cnt | cnt:4 | no idea |
| strand | S+ or S- | strand |
| chromesome | 16 | chromesome the 5' part aligned to |
| start | 79211603 | start position on the chromesome |
| pos | last or first | the unmapped chunk in front or behind the mapping chunk |
| seq | GGTTCCCTCTCATCCCA ... | unmapped chunk |

**join.fa.gz|overlap.fa.gz|nogap.fa.gz**

*join contains fusions with a gap between two parts* 

| part1 | <=seq=> | part2 | 

*overlap contains fusions that two parts having overlap seqs*

| === part1 = | = overlap = | = part2 === |

*nogap contains fusions connected with no additional seqs*

| part1 || part2 |


| column | example | explanation | 
| :---: | :---: | :---:|
| reads id with overlap score | >d5560150-4064-45f8-b9b8-b00ad2fe70b9,overlap:-78 | reads id and overlap score, **-** means join type, **+** means overlap type, **0** means nogap, **number** means length|
| cnt | cnt:4 | no idea |
| end, start | 2305,2168 | end of the first part on reads,start of the second part |
| strand | S+- | strand for both parts |
| chromesome | 4,5 | which chromesomes are two parts aligned to |
| start-part1 | 33272088 | start of part 1 on reference chromesome |
| start-part2 | 41956686 | start of part 2 on reference chromesome |
| start (nogap) | 41956686 | start of the part1 on reference chromesome |
| same chromesome | false | two parts belong to the same chromesome |
| middle seq (join) | CCAACAT | the gap seqs |
| overlap seq (overlap) | AGG | the overlap seqs |
| last six bps on part 1 | GTGATC | the last 6 bps before the joint point |
| first six bps on part 2 | CATCGT | the first 6 bps following the joint point |
