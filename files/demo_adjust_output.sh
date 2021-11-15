#!/usr/bin/env bash


input_file=/tmp/${1}.txt
output_file=/tmp/${1}_adjusted.txt

echo ${input_file}
echo ${output_file}

cut -c 44- ${input_file} > ${output_file}

echo $(cat ${output_file})

#sed -i '1,2d' ${output_file}

# Remove a space at the end of each line.
sed -i "s/ \$//g" ${output_file}

# Remove the message id at the first line.
sed -i "1s/ [0-9]\+\$//g" ${output_file}

# Replace the time
sed -i "s/[0-9]\{2\}\.[0-9]\{2\}\.[0-9]\{2\}/hh.mm.ss/g" ${output_file}
sed -i "s/[0-9]\{2\}:[0-9]\{2\}:[0-9]\{2\}/hh:mm:ss/g" ${output_file}

# Replace the date
sed -i "s/[0-9]\{4\}\/[0-9]\{2\}\/[0-9]\{2\}/yyyy\/mm\/dd/g" ${output_file}
sed -i "s/[0-9]\{2\}\/[0-9]\{2\}\/[0-9]\{4\}/mm\/dd\/yyyy/g" ${output_file}
sed -i "s/[0-9]\{4\}\/[0-9]\{3\}/yyyy\/ddd/g" ${output_file}

#tmp=$(sort $output_file) && echo "$tmp" > ${output_file}
