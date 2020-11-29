rm -f Out.ps
cp -r tunes/ alto-tunes/
find alto-tunes/*/*.abc -exec sed -i 's/%ALTO //g' {} \;
find alto-tunes/*/*.abc -exec abcm2ps {} -O = \;
rm -r alto-tunes/
mkdir -p rendered-alto
rm -f rendered-alto/*
mv *.ps rendered-alto
cd rendered-alto/
find *.ps -exec ps2pdf {} \; -exec echo {} \;
rm *.ps
echo "Generating merged alto pdf"
pdftk * cat output cucb_all_sets_alto.pdf
cd ..
echo "Done"
