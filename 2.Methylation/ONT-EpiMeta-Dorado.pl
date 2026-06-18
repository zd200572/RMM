use File::Basename;
use Getopt::Long;
use FindBin qw($Bin);

sub usage{
	print STDERR <<USAGE;
	Version 1.0 2025-12-09 by YaoYe
	Pipeline for analysis ONT epi-meta data

	All dir must be abosolute pathway!!!
	Options
		-input  <s> : Required, Col1:SampleID Col2:CellID Col3:Barcode
		-ref    <s> : Required, ref.fa
		-bamdir <s> : Required, bam file directory
		-out   <s> : Optional, default: pwd 
USAGE
}

my ($input,$out,$ref,$bamdir);
GetOptions(
    "input:s"=>\$input,
    "out:s"=>\$out,
    "ref:s"=>\$ref,
    "bamdir:s"=>\$bamdir,
);
if(!defined $input || !defined $ref || !defined $bamdir){
        &usage();
        exit;
}

my ($line,@inf);
my $out||=`pwd`;chomp $out;
`mkdir -p $out/shell $out/01.mergebam $out/02.alignbam`;

my (%sam_cb,%sam);
open IN, "$input" or die "can not open file: $input\n";
<IN>;
while($line=<IN>){
	chomp $line;
	@inf=split /\t/,$line;
	my $temp=$inf[1]."_pass_".$inf[2];
	$sam_cb{$temp}=$inf[0];
	$sam{$inf[0]}.=$temp."\n";
}
close IN;

#step1 merge bam file
open OA,">$out/shell/S01.mergebam.sh";
print OA "source activate /mnt/sdb/taoye/mamba/envs/DeepMod2\n";
open OC,">$out/shell/S02-aligned.sh";
print OC "source activate /mnt/sdb/taoye/mamba/envs/DeepMod2\n";
`rm $out/01.mergebam/*.bamlist`;
my $cmd=`ls $bamdir/*bam`;
chomp $cmd;
@inf=split /\n/,$cmd;
for(my $i=0;$i<=$#inf;$i++){
	my ($name, $dir, $suffix) = fileparse($inf[$i]);
	my @ele=split /_/,$name;
	my $temp=join("_",@ele[0..2]);
	if(defined $sam_cb{$temp}){
		open OB,">>$out/01.mergebam/$sam_cb{$temp}.bamlist";
		print OB "$inf[$i]\n";
		close OB;
	}
}
foreach my $i (keys %sam){
	print OA "bamtools merge -list $out/01.mergebam/$i.bamlist -out $out/01.mergebam/$i.merged.bam\n";
	print OC "samtools fastq $out/01.mergebam/$i.merged.bam -T MM,ML,mv,ts \| minimap2 -ax map-ont $ref - -y -t 4 |samtools view -o $out/02.alignbam/$i.aligned.bam\n";
}
close OA;
close OC;


