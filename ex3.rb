require 'bio'

if ARGV.length < 1
  puts 'Please add an input file.'
  exit 1
elsif ARGV.length > 2
  puts 'Please do not add any extra parameters'
  exit 1
end

INPUT_FILE = ARGV[0]
OUTPUT_FILE = ARGV[1] || 'ex1result.fas'

puts "Reading from #{INPUT_FILE}..."
begin
  entries = Bio::GenBank.open(INPUT_FILE)
rescue => e
  puts "Whoops, an error has appeared: #{e}" 
  exit 1
end

puts "Writing to #{OUTPUT_FILE}..."
File.open(OUTPUT_FILE, 'w') { |file| entries.each_entry { |entry| file.write(entry.to_biosequence.output_fasta) } }

puts 'Done!'