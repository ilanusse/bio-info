require 'bio'

if ARGV.length < 1
  puts 'Please use a pattern.'
  exit 1
elsif ARGV.length > 2
  puts 'Please do not add any extra parameters'
  exit 1
end

PATTERN = ARGV[0]
INPUT_FILE = ARGV[1] || 'ex2.out'

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
