export MACOSX_DEPLOYMENT_TARGET=12.4
export CC=clang
export CXX=clang++ 

pip install numba numpy
pip install pandas scikit-learn omegaconf
pip install rdkit-pypi biopython
mamba install openbabel

TORCH='1.13.0'
pip install torch=="$TORCH"
pip install --no-cache-dir torch-scatter torch-sparse torch-cluster -f https://data.pyg.org/whl/torch-"$TORCH"+cpu.html
pip install torch-geometric

pip install pyright python-lsp-server
