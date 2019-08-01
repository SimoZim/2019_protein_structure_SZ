#!/usr/bin/env bash
"""
Created on Fri May 31 16:39:13 2019
@author: Simone Zimmerl
"""
set -euxo pipefail  # https://vaneyckt.io/posts/safer_bash_scripts_with_set_euxo_pipefail/

# 01_getdownload:
chmod 777 bin/select_from_pdb.cpython-36.pyc # to get all privileges
python bin/select_from_pdb.cpython-36.pyc 50 selected_entries.txt # selects 50 entries from pdb and save them in a text-file
chmod 777 bin/download_from_pdb.cpython-36.pyc # to get all privileges
python bin/download_from_pdb.cpython-36.pyc selected_entries.txt # downloads the 50 selected files and creates the directory pdb

# move the files into the right directory
mv selected_entries.txt 01_getdownload/results
mv pdb/*.ent 01_getdownload/results

# clean up the directory 
rmdir pdb # delete the emty directory pdb