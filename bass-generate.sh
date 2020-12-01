rm -f Out.ps
cp -r tunes/ bass-tunes/
find bass-tunes/*/*.abc -exec sed -i 's/%BASS //g' {} \;
find bass-tunes/*/*.abc -exec abcm2ps {} -O = \;
rm -r bass-tunes/
mkdir -p rendered-bass
rm -f rendered-bass/*
mv *.ps rendered-bass
cd rendered-bass/
find *.ps -exec ps2pdf {} \; -exec echo {} \;
rm *.ps
echo "Generating merged bass pdf"
pdftk * cat output cucb_all_sets_bass.pdf
cd ..
echo "Done"
