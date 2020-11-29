import sys
from shutil import copyfile

set_name = num_pages = None
sets = []
for line in sys.stdin:
    line = line.strip()

    if not set_name:
        set_name = line
        continue

    if set_name and not num_pages:
        num_pages = int(line)
        assert num_pages in {1, 2}
        set_path = (f'padded_sets/{set_name}.pdf')
        sets.append([set_path, num_pages])    
        set_name = num_pages = None
        continue

    raise Exception(f'Invalid input: {line}')

total_pages = 0
for i, (path, pages) in enumerate(sets):
    if pages == 2 and total_pages % 2:
        copyfile('spacer.pdf', sets[i-2][0].replace('.pdf', '.spacerpdf'))
        print('Space before', sets[i-1][0])
        total_pages += 1
    total_pages += pages

