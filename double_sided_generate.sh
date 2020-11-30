mkdir -p padded_sets
cp rendered/* padded_sets

find padded_sets/*.pdf -exec pdftk {} dump_data \; | grep -oP "(?:\w+)(?=\.abc$)|(?<=NumberOfPages\:\s)\d+" | tee pages_per_set.txt
cat pages_per_set.txt | python3 add_padding.py
#cp spacer.pdf padded_sets/AAAA.pdf
pdftk padded_sets/* cat output MERGED_DOUBLE_SIDED.pdf

rm -r padded_sets
