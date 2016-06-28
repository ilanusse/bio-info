require 'bio'

if ARGV.length < 1
  puts 'Please add an input file.'
  exit 1
elsif ARGV.length > 3
  puts 'Please do not add any extra parameters'
  exit 1
end

INPUT_FILE = ARGV[0]
ORF_OUTPUT_FILE = ARGV[1] || 'ex4-orf.out'
PROSITE_OUTPUT_FILE = ARGV[2] || 'ex4-pro.out'

puts "Reading from #{INPUT_FILE}..."
begin
  fasta_info = Bio::FlatFile.open(Bio::FastaFormat, ARGV[0])
  blast_factory = Bio::Blast.remote('blastn', 'dbest', '-e 0.001', 'genomenet')
rescue => e
  puts "Whoops, an error has appeared: #{e}"
  exit 1
end

puts "Writing EMBOSS getorf result to #{ORF_OUTPUT_FILE}..."
File.open(ORF_OUTPUT_FILE, 'w') do |f|
  f.puts Bio::EMBOSS.run('getorf', '-sequence', INPUT_FILE)
end

puts "Writing EMBOSS patmatmotifs result to #{PROSITE_OUTPUT_FILE}..."
File.open(PROSITE_OUTPUT_FILE, 'w') do |f|  
  f.puts Bio::EMBOSS.run('patmatmotifs', '-full', '-noprune', '-sequence', INPUT_FILE)
end

puts 'Done!'
