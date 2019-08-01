#!/usr/bin/env bash
"""
Created on Fri May 31 16:39:13 2019
@author: Simone Zimmerl
"""
set -euxo pipefail  # https://vaneyckt.io/posts/safer_bash_scripts_with_set_euxo_pipefail/


# 03_visualise
# create symbolic link
ln -s /home/76881/2019_protein_structure_SZ/02_parse_pdb_files/results /home/76881/2019_protein_structure_SZ/03_visualise/data

chmod 777 bin/plot_multibar.cpython-36.pyc # to get all privileges
python bin/plot_multibar.cpython-36.pyc /home/76881/2019_protein_structure_SZ/03_visualise/data > /home/76881/2019_protein_structure_SZ/03_visualise/results/plot.pdf
