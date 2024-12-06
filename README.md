#1 docker(easist way)  
docker run -itv $PWD:/data -w /test --rm kazumax/genome_quest:0.2  
#test run (5 minutes)  
genome_quest -1 short_R1.fq.gz -2 short_R2.fq.gz -n ONT.fq.gz -p /usr/local/bin/pilon-1.24.jar -b /nodeDB/nodesDB.txt -d /nodeDB/uniprot_ref_proteomes.diamond.dmnd  






#2 create enviroment
git clone https://github.com/kazumaxneo/genome_quest_prokaryotes.git
cd genome_quest_prokaryotes/

#dependency
samtools > 1.21  
minimap2  > 2.24

mamba env create --file env.yaml
conda activate genome_quest

- minimap2  
curl -L https://github.com/lh3/minimap2/releases/download/v2.28/minimap2-2.28_x64-linux.tar.bz2 | tar -jxvf -
cp minimap2-2.28_x64-linux/minimap2 /usr/local/bin/

- SV-Quest1  
git clone https://github.com/kazumaxneo/SV-Quest.git
cd SV-Quest/
mv SV-Quest.pl /usr/local/bin/SV-Quest1.pl  
sudo cpan Statistics::Basic  
sudo cpan Statistics::Lite  
