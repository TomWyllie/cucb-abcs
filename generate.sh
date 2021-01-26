rm -f Out.ps
find tunes/*/*.abc -exec abcm2ps {} -O = \;
mkdir -p rendered
rm -f rendered/*
mv *.ps rendered
cd rendered/
find *.ps -exec ps2pdf {} \; -exec echo {} \;
rm *.ps
echo "Generating merged.pdf"
pdftk * cat output MERGED.pdf
mv MERGED.pdf ../merged-pdfs/CUCB_all_treble.pdf
cd ..
echo "PDFs generated in directory rendered/ and merged-pdfs/"
