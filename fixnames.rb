#!/usr/bin/ruby
# Script to repair video filenames
# Written by JK Wood
# joshuakwood@gmail.com

Dir.glob("*.avi") { |file| File.rename(file, file.gsub(" ", ".").gsub("-.", ""))}
Dir.glob("*.mkv") { |file| File.rename(file, file.gsub(" ", ".").gsub("-.", "")) }
Dir.glob("*.mp4") { |file| File.rename(file, file.gsub(" ", ".").gsub("-.", "")) }
