require 'bio'

if ARGV.length > 1
  puts 'Please do not add any extra parameters'
  exit 1
end

INPUT_FILE = 'ex2msa.input'
OUTPUT_FILE = ARGV[0] || 'ex2b.out'

puts "Reading from #{INPUT_FILE}..."
seqs = []
begin
  File.readlines(INPUT_FILE).each do |line|
    seqs << Bio::Sequence::NA.new(line)
  end
rescue => e
  puts "Whoops, an error has appeared: #{e}"
  exit 1
end

puts 'Performing MSA...'
puts "Writing MSA report to #{OUTPUT_FILE}..."
File.open(OUTPUT_FILE, 'w') do |f|
  a = Bio::Alignment.new(seqs)
  puts a.consensus
end

puts 'Done!'
