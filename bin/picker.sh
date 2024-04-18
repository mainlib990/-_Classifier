#!/bin/sh

index_file="$1"
input_dir="$2"
output_dir="$3"

mkdir -p "$output_dir"

while read -r number;
do
	find "$input_dir" -name "$number.*.pdf" -exec cp -f {} "$output_dir" \;
done < "$index_file"
