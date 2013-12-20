#!/bin/bash
# shell script to convert CBR archives into PDF files on Linux
# Written and maintained by Vipul Nataraj(http://www.github.com/vnataraj)
# Dependencies: unrar, convert
# Note: filenames with spaces in them will probably fail as of this iteration
usage="Usage:  ./cbrtopdf path-to-file ";
filepath=$1
filename=$(basename $filepath ".cbr")
filedir=$(dirname $filepath);
cbr=$filename".cbr"
rar=$filename".rar"
pdf=$filename".pdf"

# Check if multiple arguments, then if not print usage
if [ -z "$filepath" ]; then
	echo $usage;
	echo $filepath;
	exit;
fi

# Change into directory containing file, and make filename into RAR Archive
cd $filedir;
mv $cbr $rar;

# Unrar RAR archive
mkdir $filename;
cd $filename;
mv ../$rar .;
unrar e $rar;
mv $rar ../.;

# Convert all the JPG's into one pdf
convert *.JPG *.jpeg *.jpg $pdf;
mv $pdf ../. ;

#Clean up a bit....
cd ..;
rm -rf $filename"/";
mv $rar $cbr;



