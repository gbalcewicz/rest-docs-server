for f in /docs/*;
  do
    if [ -d $f ]; then
      /bin/build-docs $f
      /bin/watch-docs $f
    fi
  done;

cd /docs-html

live-server . --wait=1000 --port=8000
