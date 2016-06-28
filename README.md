## TP BIO INFO

### General info
Be sure to have `ruby` installed. 
Run `gem install bio` to install BioRuby.

### Exercise 1
Usage: `ruby ex1.rb GENEBANKFILE.gb OUTPUT-PATH.fas`

The only required parameter to the script is the Genebank file you wish to convert to FASTA format. This repository has `sequence.gb` in the `progeria` directory to start.
The output path defaults to `ex1result.fas`.

### Exercise 2a
Usage: `ruby ex2.rb INPUT_FILE.fas OUTPUT_FILE`

The required parameter INPUT_FILE.fas is a FASTA format input file.
The parameter OUTPUT_FILE is the file where the output for the BLAST shall be written, and it defaults to `ex2.out`.

### Exercise 2b
To be able to correctly run this script, you must first install ClustalW:
In Ubuntu, this is as simple as running `sudo apt-get install clustalw`.

Usage: `ruby ex2b.rb INPUT_FILE.fas OUTPUT_FILE`

The INPUT_FILE.fas parameter is a multi-sequence FASTA format input file. You can use the `msa.fas` file in the project directory.
The OUTPUT_FILE parameter is the output file for the multi-sequence alignment, and it defaults to `ex2b.out`.

### Exercise 3
Usage: `ruby ex3.rb PATTERN INPUT_FILE`

The PATTERN parameter is the pattern to be searched for in the given INPUT_FILE.

### Exercise 4 
To be able to correctly run this script, you must first do two things:

1) Install EMBOSS. In Ubuntu, this is as simple as running `sudo apt-get install emboss`.
2) Run `sudo ruby ex4b.rb` in the project directory. This will run the EMBOSS prosextract program, which will process your PROSITE database into a `prosite.lines` file for the second part of the `ex4.rb` script.

Usage: `ruby ex4.rb INPUT_FILE.fas ORF_OUTPUT_PATH PROSITE_OUTPUT_PATH`

The input file is required, a FASTA format sequence file.
ORF_OUTPUT_PATH is the path where the output for the `getorf` EMBOSS program shall be written, and defaults to `ex4-orf.out`.
PROSITE_OUTPUT_PATH is the path where the output for the `patmatmotifs` EMBOSS program shall be written, and defaults to `ex4-pro.out`.