export MACOSX_DEPLOYMENT_TARGET=12.4
export CC=clang
export CXX=clang++ 

TORCH='2.0.0'
pip --no-cache-dir install torch=="$TORCH"
#pip --no-cache-dir install torch_scatter torch_sparse torch_cluster -f https://data.pyg.org/whl/torch-"$TORCH"+cpu.html
#pip --no-cache-dir install torch-geometric

pip install numpy pandas scikit-learn omegaconf rdkit-pypi biopython
mamba install openbabel

pip install pyright python-lsp-server
