#!/bin/bash

sh ./update_data.sh
sh ./make_preproc.sh
gnuplot ./make_postproc.gpi