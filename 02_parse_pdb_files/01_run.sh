#!/usr/bin/env bash
"""
Created on Fri May 31 16:39:13 2019
@author: Simone Zimmerl
"""
set -euxo pipefail  # https://vaneyckt.io/posts/safer_bash_scripts_with_set_euxo_pipefail/

# 02_parse_pdb-files
# create symbolic links
ln -s /home/76881/2019_protein_structure_SZ/01_getdownload/results  /home/76881/2019_protein_structure_SZ/02_parse_pdb_files/data
ln -s /home/76881/2019_protein_structure_SZ/data  /home/76881/2019_protein_structure_SZ/02_parse_pdb_files/data

chmod 777 bin/parse_pdb_files.cpython-36.pyc # to get all privileges
python bin/parse_pdb_files.cpython-36.pyc  /home/76881/2019_protein_structure_SZ/02_parse_pdb_files/data >  /home/76881/2019_protein_structure_SZ/02_parse_pdb_files/results/relative_frequencies.csv
