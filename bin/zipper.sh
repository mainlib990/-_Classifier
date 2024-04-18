#! /bin/sh

count=$1
head_tmp_dir="$2"
nonhead_tmp_dir="$3"
output_dir="$4"

rm -rf "$output_dir"

mkdir -p "$output_dir"

seq $count | while read -r number;
do
	#new_dir="$output_dir/$number"
	new_dir="$output_dir"

	mkdir -p "$new_dir"

	# head
	head_filename=$(find "$head_tmp_dir" -name "$number.*.pdf")
	head=$(echo "$head_filename" | sed -E "s/.*\/([[:digit:]]+.*)/\1/")
	cp -f "$head_filename" "$new_dir/$head"

	# nonhead
	find "$nonhead_tmp_dir" -name "$number.pdf" -exec cp -f "{}" "$new_dir/$number.pdf" \;
	
done;
