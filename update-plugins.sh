cd './bundle';
for f in */; do 
  (echo $f && cd $f && git pull)
done;
