#!/usr/bin/ruby
# Script to repair video filenames
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

Dir.glob("*.avi") { |file| File.rename(file, file.gsub(" ", ".").gsub("-.", ""))}
Dir.glob("*.mkv") { |file| File.rename(file, file.gsub(" ", ".").gsub("-.", "")) }
Dir.glob("*.mp4") { |file| File.rename(file, file.gsub(" ", ".").gsub("-.", "")) }
