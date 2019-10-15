#!/usr/bin/env bash
exec /arm/tools/setup/bin/mrun +swdev +ruby/ruby/2.5.1 ruby $0 "$@"
#!/usr/bin/env ruby

require 'optparse'

$script = File.realpath($0)
$script_dir = File.dirname($script)
$LOAD_PATH.unshift("#{$script_dir}/../path/to/lib")

at_exit {
	puts 'done'
}

if __FILE__ == $0
	now = Time.now.strftime('%Y%m%d-%H%M%S-Week%V-%a-%T')
	options = Hash.new
	parser = OptionParser.new do |opts|
		opts.banner = "Usage: #{$0} [options] [FILE]"
		opts.separator ''
		opts.separator 'Options:'
		opts.on '-h', '--help', 'Show this message' do
			puts opts
			exit
		end
		opts.on('-v', '--[no-]verbose', 'Run verbosely') do |v|
			options[:verbose] = v
		end
	end

	begin
		parser.parse!
	rescue OptionParser::InvalidOption => e
		puts e
		puts parser
		exit
	end

	p options
	puts "ARGV: #{ARGV.join(' ')}"
end

