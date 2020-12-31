#!/bin/sh

# Simple script to ensure your system will boot after
# a kernel upgrade using elilo. Modify your boot path
# as necessary. I run this out of /boot manually after
# each kernel upgrade.

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

cp /boot/vmlinuz /boot/efi/EFI/Slackware/vmlinuz
cp /boot/elilo-x86_64.efi /boot/efi/EFI/Slackware/elilo.efi
exit
