#!/bin/bash

# go to counts
mkdir web_summaries
cd ../../counts

# extract webs summaries
for sample in PP_11 PP_13 PP_14 PP_15 PP_19 PP_22 PP_23 PP_4
do
	cp $sample/outs/web_summary.html web_summaries/"$sample"_web_summary.html
done
