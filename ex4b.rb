require 'bio'

puts 'Running EMBOSS prosextract program before patmatmotifs to process PROSITE database...'
Bio::EMBOSS.run('prosextract', '-prositedir', "#{Dir.pwd}/prosite")