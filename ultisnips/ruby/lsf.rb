
# vim: ft=snippets

# ==============================================================================
# LSF OPERATIONS
# ==============================================================================
snippet lsf "Submit self to LSF" b
# Submit job to LSF
unless ENV['LSB_BATCH_JID'] or ARGV.include? '-local'
	argv = ARGV.map { |arg| arg =~ /\s/ ? "\'#{arg}\'" : arg }
	argv << '-local'
	\`bsub #{$0} #{argv.join(' ')}\`
end
endsnippet

snippet bsub "Submit command to LSF" b
job = {
	description: '-Jd regress_tb-EA-sim_mti',
	select:      "-R 'select[rhe7]'",
	name:        "-J 'array_name[1-#{count}]'",
	time:        '-W 2:00',
	memory:      '-M 8192000',
	output:      '-o output.%J.%I.log'
}
cmd = "${1:command}"
bsub = "bsub #{job.values.join(' ')} #{cmd}"
puts "==> #{bsub}"
stdout, stderr, status = Open3.capture3(bsub)
if status.exitstatus != 0
	puts stdout
	puts stderr
	exit status.exitstatus
end
job_id, queue = stdout.scan(/Job <(\d+)> is submitted to queue <(\w+)>/).flatten
puts "Job <#{job_id}> submitted to queue <#{queue}>"
endsnippet

snippet bwait "Function to wait for LSF job to finish" b
def bwait(job_id)
	puts "Waiting for #{job_id} to finish..."
	stdout, stderr, status = Open3.capture3("bwait -w 'ended(#{job_id})'")
	return stdout, stderr, status.exitstatus
end
endsnippet

snippet bkill "Function to kill LSF job" b
def bkill(job_id)
	stdout, stderr, status = Open3.capture3("bkill #{job_id}")
	return stdout, stderr, status.exitstatus
end
endsnippet

