require 'bio'

if ARGV.length < 1
  puts 'Please add an input file.'
  exit 1
elsif ARGV.length > 2
  puts 'Please do not add any extra parameters'
  exit 1
end

INPUT_FILE = ARGV[0]
OUTPUT_FILE = ARGV[1] || 'ex2.out'

puts "Reading from #{INPUT_FILE}..."
begin
  fasta_info = Bio::FlatFile.open(Bio::FastaFormat, ARGV[0])
  blast_factory = Bio::Blast.remote('blastn', 'dbest', '-e 0.001', 'genomenet')
rescue => e
  puts "Whoops, an error has appeared: #{e}"
  exit 1
end

puts "Writing BLAST report to #{OUTPUT_FILE}..."
File.open(OUTPUT_FILE, 'w') do |f|
  fasta_info.each_entry do |entry|
    puts 'Preparing entry...'
    report = blast_factory.query(entry.seq)
    puts 'Querying...'
    report.hits.each_with_index do |hit, i|
      f.puts '------------------------------------------------'
      f.puts "Hit No. #{i}"
      f.puts hit.accession
      f.puts hit.definition
      f.puts " - Query length: #{hit.len}"
      f.puts " - Number of identities: #{hit.identity}"
      f.puts " - Length of Overlapping region: #{hit.overlap}"
      f.puts " - % Overlapping: #{hit.percent_identity}"
      f.puts " - Query sequence: #{hit.query_seq}"
      f.puts " - Subject sequence: #{hit.target_seq}"
      puts Bio::Sequence.auto(hit.target_seq).output_fasta
      hit.hsps.each_with_index do |hsps, hsps_index|
        f.puts " - Bit score: #{hsps.bit_score}"
        f.puts " - Gaps: #{hsps.gaps}"
      end
    end
  end
end

puts 'Done!'
