#! /bin/sh

index_file="$1"
picked_tmp_dir="$2"
output_dir="$3"

mkdir -p "$output_dir"

seq=1

while read -r number;
do
	find "$2" -name "$number.*.pdf" -exec cp -f {} "$output_dir/$seq.pdf" \;

	let seq++
done < "$1"
