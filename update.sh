#!/bin/sh
for d in */ ; do
    cd $d
    echo $d
    for f in *.md; do
        echo $f
        NAME=`echo "$f" | cut -d'.' -f1`
        markdown $f > $NAME.html
        echo 'done'
    done
    sed -i 's_<script> window.scroll(0,200000) </script>__g' *.html
    cd ..
    echo 'done'
done
echo 'add'
git add --all
echo 'commit'
git commit -m $0
echo 'push'
git push origin main
echo 'done'
