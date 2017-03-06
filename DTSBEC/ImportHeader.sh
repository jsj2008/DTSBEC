#!/bin/bash

headfilename='./DTSBEC/BECHeader.h'

rm -rf $headfilename && touch $headfilename
echo "#ifndef BECHeader_h" >> $headfilename
echo "#define BECHeader_h" >> $headfilename

echo -e "\n" >> $headfilename

filelist=`ls ./DTSBEC`
for file in $filelist
do 
 extension=${file##*.}
 if [ $extension = "h" ] && [ $file != "BECHeader.h" ] 
 then
     line="#import \"$file\""
     echo  $line >> $headfilename
 fi
done

echo -e "\n" >> $headfilename

echo "#endif" >> $headfilename
