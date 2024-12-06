# Genome Quest Setup and Usage

## 1. Docker (Easiest Way)

Run the following command to start a Docker container with the necessary environment:

```bash
docker run -itv $PWD:/data -w /test --rm kazumax/genome_quest:0.2
```

To perform a test run, execute:

```bash
genome_quest -1 short_R1.fq.gz -2 short_R2.fq.gz -n ONT.fq.gz -p /usr/local/bin/pilon-1.24.jar -b /nodeDB/nodesDB.txt -d /nodeDB/uniprot_ref_proteomes.diamond.dmnd
```

git clone https://github.com/kazumaxneo/genome_quest_prokaryotes.git
cd genome_quest_prokaryotes/

Dependencies
Ensure the following tools are installed:

samtools > 1.21
minimap2 > 2.24
Create and activate the conda environment:
```bash
mamba env create --file env.yaml
conda activate genome_quest
curl -L https://github.com/lh3/minimap2/releases/download/v2.28/minimap2-2.28_x64-linux.tar.bz2 | tar -jxvf -
cp minimap2-2.28_x64-linux/minimap2 /usr/local/bin/
git clone https://github.com/kazumaxneo/SV-Quest.git
cd SV-Quest/
mv SV-Quest.pl /usr/local/bin/SV-Quest1.pl
sudo cpan Statistics::Basic
sudo cpan Statistics::Lite
```
