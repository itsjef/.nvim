cd './bundle';
for f in */; do 
  (cd $f && git pull)
done;
