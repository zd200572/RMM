#dorado methylation calling from ONT H5 files
./dorado-1.3.0-linux-x64/bin/dorado basecaller ./dorado-1.3.0-linux-x64/bin/dna_r10.4.1_e8.2_400bps_sup@v5.0.0  ./pod5/PBG16288_6a7dbc14_1759c0aa_107.pod5   --modified-bases 4mC_5mC 6mA -x cuda:all > PBG16288_6a7dbc14_1759c0aa_107.bam
#将bam文件比对参考基因组，同时按照样品barcode进行拆分
#本身下机的bam文件中有A/C的修饰，使用的calling工具为Dorado
perl ONT-EpiMeta-Dorado.pl  -input info.txt -ref MAGs.ANI95.fa -bamdir ./bam/

#从bam文件中得到表观信息
MicrobeMod call_methylation -b sample.aligned.bam -r MAGs.ANI95.fa -t 40


