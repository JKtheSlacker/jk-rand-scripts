#!/usr/bin/ruby
#
# Script to download entire 73 magazine
# archive from archive.org

# Written by JK Wood <joshuakwood@gmail.com>

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

# Gotta step through the years
#

require 'open-uri'

# Plan: Loop through each year from 1960 to 2003
# Loop through each month from 01 to 12
# Download each file as PDF
#
# Sample link: https://archive.org/download/73-magazine-2002-12/12_December_2002.pdf
# Formatted: https://archive.org/download/73-magazine-YYYY-MM/MM_MName_YYYY.pdf
#
# First: Hash table of MM to MName
#

months = [
  "January",
  "February",
  "March",
  "April",
  "May",
  "June",
  "July",
  "August",
  "September",
  "October",
  "November",
  "December"
]

(1960..2003).each do |y|
  months.each do |m|
    month = sprintf("%02d",months.index(m)+1)
    result = open("https://archive.org/download/73-magazine-#{y}-#{month}/#{month}_#{m}_#{y}.pdf") do |pdf|
      File.open("#{month}_#{m}_#{y}.pdf", "wb") do |file|
        file.write(pdf.read)
      end
  end
end

