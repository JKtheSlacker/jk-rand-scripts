#!/usr/bin/ruby
# Script to search Slackware packages
# for text - filenames being the most
# intuitive use.

# Written by JK Wood
# joshuakwood@gmail.com

# The nice thing about Ruby is, if the class doesn't contain
# the method you want, you just write it and move on.
class File
	def include? pattern
		each_line do |line|
			if line.include? pattern
				return true
			end
		end
		return false
	end
end

# Every script should have a usage statement.
def usage
	puts "\nScript for finding patterns in packages"
	puts "\nUsage: #{$0} DESIRED_FILE\n\n"
	exit
end

# Ensure we're being used correctly.
if ARGF.argv.length == 0 or ARGF.argv[0].eql? "-h"
	usage
end

# I will probably clean this up. Someday.
origDir = Dir.pwd
foundMatch = false
Dir.chdir "/var/log/packages/"
Dir.foreach("/var/log/packages") do |filename|
	if !File.directory? filename
		file = File.open filename
		if file.include? ARGF.argv[0]
			puts "In #{filename}:"
			foundMatch = true
			file.rewind
			file.each_line do |line|
				if line.include? ARGF.argv[0]
					puts "     #{line}"
				end
			end
		end
		file.close
	end
end

Dir.chdir origDir

if !foundMatch
	puts "No packages contained that pattern."
end
