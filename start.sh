#! /bin/sh

rm -rf "tmp"

index_file="numbers.txt"

# pick
echo "picking..."
./bin/picker.sh "$index_file" "resources/본문" "tmp/picked"

# head
echo "head mapping..."
./bin/head_mapper.sh "$index_file" "tmp/picked" "resources/간지" "tmp/head_mapped"

# nonhead
echo "nonhead mapping..."
./bin/nonhead_mapper.sh "$index_file" "tmp/picked" "tmp/nonhead_mapped"

# result
echo "zipping..."
count=$(wc -l < $index_file)
./bin/zipper.sh $count "tmp/head_mapped" "tmp/nonhead_mapped" "result"
