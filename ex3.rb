require 'bio'

if ARGV.length < 1
  puts 'Please add an input file.'
  exit 1
elsif ARGV.length > 2
  puts 'Please do not add any extra parameters'
  exit 1
end

INPUT_FILE = 'ex2.out'
PATTERN = ARGV[0]

puts "Searching in #{INPUT_FILE}..."
begin
  matches =  File.open(INPUT_FILE).grep(/#{PATTERN}/)
  matches = matches.join("\n\n")
  puts matches
rescue => e
  puts "Whoops, an error has appeared: #{e}"
  exit 1
end

puts 'Done!'
