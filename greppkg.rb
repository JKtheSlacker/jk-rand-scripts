#!/usr/bin/ruby
# Script to search Slackware packages
# for text - filenames being the most
# intuitive use.

# Written by JK Wood
# joshuakwood@gmail.com

# Script is released under the Dog-on-Fire License:
# If use of this script causes your dog to catch on fire,
# you agree to send me five dollars.  Or a picture
# of the dog on fire.
# Otherwise, you're on your own.  I've tested the script
# on my own computer, and it hasn't broken anything.
# So if it does it on your computer, that falls in
# the realm of "Not my problem."
#
# Of course, if you'll send a bug report to the above
# email address, I may be able to see what you did
# wrong and prevent it from happening in the future.
# In which case, I may just send YOU five dollars.

# Oh, and feel free to copy it and modify it as you
# see fit. Or as I see fit. Or as I fit. Although
# that is unlikely, as I am rather tall.

# The nice thing about Ruby is, if the class doesn't contain
# the method you want, you just write it and move on.
class File
	def include? pattern
		each_line do |line|
      if line.downcase.include? pattern.downcase
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
Dir.foreach("/var/log/packages/") do |filename|
	if !File.directory? filename
		file = File.open filename
		if file.include? ARGF.argv[0]
			puts "In #{filename}:"
			foundMatch = true
			file.rewind
			file.each_line do |line|
        if line.downcase.include? ARGF.argv[0].downcase
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
