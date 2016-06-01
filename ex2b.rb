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

File.open(OUTPUT_FILE, 'w') do |f|
  a = Bio::Alignment.new(seqs)
  clustalw = Bio::ClustalW.new
  puts 'Performing MSA...'
  a.do_align(clustalw)
  puts "Writing MSA report to #{OUTPUT_FILE}..."
  f.write(clustalw.output)
  f.write(clustalw.data_stdout)
  f.write("\nCommand run:\n")
  f.write(clustalw.command.inject("") { |c, t| "#{c.to_s} #{t}" } + "\n")
  f.write("\nExit Status:\n")
  f.write(clustalw.exit_status)
end

puts 'Done!'
