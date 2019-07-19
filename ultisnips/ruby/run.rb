
# vim: ft=snippets

# ==============================================================================
# RUN
# ==============================================================================
snippet run "Open3.capture3(command)" b
require 'open3'
stdout, stderr, status = Open3.capture3(${1:'command'})
raise "Command '#{$1}' failed" unless status.exitstatus == 0
endsnippet

snippet run "PTY.spawn(command)" b
require 'pty'
PTY.spawn(${1:'command'}) do |stdout, stdin, pid|
	stdout.each do |line|
		puts line
	end
	rescue Errno::EIO
end
status = \$?
raise "Command '#{$1}' failed" unless status.exitstatus == 0
endsnippet

snippet log "" b
$stdout = Class.new do
	def initialize
		basename = File.basename($0, File.extname($0))
		now = Time.now.strftime('%Y%m%d-%H%M%S')
		@f = File.open("#{basename}-#{now}.log", "w")
		@stdout = $stdout
	end
	def write(string)
		@f.write string
		@stdout.write string
	end
end.new
endsnippet

