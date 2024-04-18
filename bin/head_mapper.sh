#! /bin/sh

index_file="$1"
picked_tmp_dir="$2"
input_dir="$3"
output_dir="$4"

mkdir -p "$output_dir"

seq=1

while read -r number;
do
	new_filename=$(find "$picked_tmp_dir" -name "$number.*.pdf" | sed -E "s/.*([[:digit:]]+)\.(.*)_.*(\.pdf)/\2/")

	find "$input_dir" -name "*파트$seq.pdf" -exec cp -f {} "$output_dir/$seq. $new_filename.pdf" \;

	let seq++;
done < "$index_file"
