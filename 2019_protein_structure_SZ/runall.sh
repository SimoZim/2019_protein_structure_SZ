#!/usr/bin/env bash
"""
Created on Fri May 31 16:39:13 2019
@author: Simone Zimmerl
"""

# at first create directory structure: example also to find in: 2019_protein_structure_SZ/bin/folder-structure.sh
 
# generation of folder-structure
mkdir /home/76881/2019_protein_structure_SZ
mkdir /home/76881/2019_protein_structure_SZ/01_getdownload
mkdir /home/76881/2019_protein_structure_SZ/02_parse_pdb_files
mkdir /home/76881/2019_protein_structure_SZ/03_visualise
mkdir /home/76881/2019_protein_structure_SZ/bin
mkdir /home/76881/2019_protein_structure_SZ/data
mkdir /home/76881/2019_protein_structure_SZ/doc

mkdir /home/76881/2019_protein_structure_SZ/01_getdownload/bin
mkdir /home/76881/2019_protein_structure_SZ/01_getdownload/data
mkdir /home/76881/2019_protein_structure_SZ/01_getdownload/results

mkdir /home/76881/2019_protein_structure_SZ/02_parse_pdb_files/bin
mkdir /home/76881/2019_protein_structure_SZ/02_parse_pdb_files/data
mkdir /home/76881/2019_protein_structure_SZ/02_parse_pdb_files/results

mkdir /home/76881/2019_protein_structure_SZ/03_visualise/bin
mkdir /home/76881/2019_protein_structure_SZ/03_visualise/data
mkdir /home/76881/2019_protein_structure_SZ/03_visualise/results

# generation of folder-structure in one step
mkdir /home/76881/2019_protein_structure_SZ /home/76881/2019_protein_structure_SZ/01_getdownload /home/76881/2019_protein_structure_SZ/02_parse_pdb_files /home/76881/2019_protein_structure_SZ/03_visualise /home/76881/2019_protein_structure_SZ/bin /home/76881/2019_protein_structure_SZ/data /home/76881/2019_protein_structure_SZ/doc /home/76881/2019_protein_structure_SZ/01_getdownload/bin /home/76881/2019_protein_structure_SZ/01_getdownload/data /home/76881/2019_protein_structure_SZ/01_getdownload/results /home/76881/2019_protein_structure_SZ/02_parse_pdb_files/bin /home/76881/2019_protein_structure_SZ/02_parse_pdb_files/data /home/76881/2019_protein_structure_SZ/02_parse_pdb_files/results /home/76881/2019_protein_structure_SZ/03_visualise/bin /home/76881/2019_protein_structure_SZ/03_visualise/data /home/76881/2019_protein_structure_SZ/03_visualise/results

# but for this project the structure with all files is provided

####

set -euxo pipefail  # https://vaneyckt.io/posts/safer_bash_scripts_with_set_euxo_pipefail/

###

# 01_getdownload:
# go to directory
cd 2019_protein_structure_SZ
chmod 777 bin/select_from_pdb.cpython-36.pyc # to get all privileges
python bin/select_from_pdb.cpython-36.pyc 50 selected_entries.txt # selects 50 entries from pdb and save them in a text-file
chmod 777 bin/download_from_pdb.cpython-36.pyc # to get all privileges
python bin/download_from_pdb.cpython-36.pyc selected_entries.txt # downloads the 50 selected files and creates the directory pdb

# move the files into the right directory
mv selected_entries.txt 01_getdownload/results
mv pdb/*.ent 01_getdownload/results

# clean up the directory 
rmdir pdb # delete the emty directory pdb

###

# 02_parse_pdb-files
# stay in directory 2019_protein_structure_SZ
# create symbolic links
ln -s 01_getdownload/results 02_parse_pdb_files/data
ln -s data 02_parse_pdb_files/data

chmod 777 bin/parse_pdb_files.cpython-36.pyc # to get all privileges
python bin/parse_pdb_files.cpython-36.pyc 02_parse_pdb_files/data > 02_parse_pdb_files/results/relative_frequencies.csv

###

# 03_visualise
# stay in directory 2019_protein_structure_SZ
# create symbolic link
ln -s 02_parse_pdb_files/results 03_visualise/data

chmod 777 bin/plot_multibar.cpython-36.pyc # to get all privileges
python bin/plot_multibar.cpython-36.pyc 03_visualise/data > 03_visualise/results/plot.pdf

###

# clean up the directory - therefore zip big files
gzip 01_getdownload/results/*.ent
