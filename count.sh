du -a tunes/ | grep .abc | cut -d/ -f2 | sort | uniq -c | sort -nr
