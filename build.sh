#/bin/bash

root=$(pwd)
output_base_dir="$1"
if [ "$output_base_dir" = "" ]; then
  output_base_dir="./"
fi
for md in $(find . -type f -name slide.md);
do
  dir=$(dirname $md)
  base_dir=$(basename $dir)
  output_dir="$output_base_dir/$base_dir/"
  mkdir -p $output_dir
  ./node_modules/cleaver/bin/cleaver $md --output=$output_base_dir/$base_dir/index.html
done;
