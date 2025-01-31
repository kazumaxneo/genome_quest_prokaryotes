### Genome Quest Setup and Usage

#### 1. Run using prebuild docker image (Easiest Way)

Run the following command to start a Docker container with the necessary environment:

```bash
docker pull kazumax/genome_quest:0.37
docker run -itv $PWD:/data -w /test --rm kazumax/genome_quest:0.37
```

To perform a test run, execute:

```bash
cd /test
genome_quest -1 short_R1.fq.gz -2 short_R2.fq.gz -n ONT.fq.gz -p /usr/local/bin/pilon-1.24.jar -b /nodeDB/nodesDB.txt -d /nodeDB/uniprot_ref_proteomes.diamond.dmnd 
```

your fastq  
```bash
genome_quest -1 sample_R1.fq.gz -2 sample_R2.fq.gz -n ONT.fq.gz -b /nodeDB/nodesDB.txt -d /nodeDB/uniprot_ref_proteomes.diamond.dmnd -p /usr/local/bin/pilon-1.24.jar
```


#### 2. Install. Create conda enviroment
```bash
git clone https://github.com/kazumaxneo/genome_quest_prokaryotes.git  
cd genome_quest_prokaryotes/
```
#### Dependencies  
following tools are required:

- samtools > 1.21
- minimap2 > 2.24
- pilon
- sambamba
- elprep
- bwa
- samtools
- bbmap
- blobtools
- unicycler
- flye
- fastp
- nanoplot
- seqkit
- bandage
- SV-Quest

Create conda environment:
```bash
cd genome_quest_prokaryotes/
mamba env create --file env.yaml
conda activate genome_quest
#minimap2
curl -L https://github.com/lh3/minimap2/releases/download/v2.28/minimap2-2.28_x64-linux.tar.bz2 | tar -jxvf -
cp minimap2-2.28_x64-linux/minimap2 /usr/local/bin/
#SV-Quest
git clone https://github.com/kazumaxneo/SV-Quest.git
cd SV-Quest/
cp SV-Quest.pl /usr/local/bin/SV-Quest1.pl
sudo cpan Statistics::Basic
sudo cpan Statistics::Lite
```
In addition, a node file and a modified uniprot DB for diamond blastx are required (included in the docker imaege).  

