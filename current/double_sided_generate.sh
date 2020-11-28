mkdir -p padded_sets
cp rendered/* padded_sets

# This line is a cheat to switch the order MorningStar (1) / MostlyEnglish (2) / Northumbrian (1) to MostlyEnglish / MorningStar / Northumbrian for (1) / (1) / (2) to save a page
mv padded_sets/MostlyEnglish.pdf padded_sets/MorningEnglish.pdf

find padded_sets/*.pdf -exec pdftk {} dump_data \; | grep -oP "(?:\w+)(?=\.abc$)|(?<=NumberOfPages\:\s)\d+" | tee pages_per_set.txt
cat pages_per_set.txt | python3 add_padding.py
cp spacer.pdf padded_sets/AAAA.pdf
pdftk padded_sets/* cat output MERGED_DOUBLE_SIDED.pdf

rm -r padded_sets
