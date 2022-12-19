export MACOSX_DEPLOYMENT_TARGET=10.9
export CC=clang
export CXX=clang++ 

mamba install scipy numpy pandas scikit-learn
mamba install -c conda-forge rdkit
mamba install pytorch==1.13.0 -c pytorch
pip install torch-scatter torch-sparse torch-cluster torch-geometric -f https://data.pyg.org/whl/torch-1.13.0+cpu.html
pip install omegaconf
pip install jedi-language-server
