# equinox mit
Contains python scripts that process mitgcm LLC4320 output for the EQUINOx project (with A. Ponte and others) 

- Geostrophy_assessment: To examine the validity of geostrophic balance, and horizontal momentum budget globally. 

- Lagrangian_vs_Eulerian_LLC4320: To perform Lagrangian and Eulerian comparisons spectrally. 

- sandbox/: Rotary spectra of horizontal velocity from drifter obs. and LLC4320 output (Yu et al. 2019 GRL); basic stuff; some tests

- GRL_LLC4320_Drifter_2019: Figures in Yu et al. 2019 (will move to an independent repository later)

- doc/: conda and git info

- datarmor: launch job/workers/cores

---
## install

All scripts require python librairies that may be installed with conda according to the following instructions [here](https://github.com/apatlpo/mit_equinox/blob/master/doc/conda.md)

---
## run on datarmor:

After having installed all libraries, and cloned this repository, go into `equinox_working/datarmor`.

### method 1 (recommended):

./launch-jlab.sh -p 7

Follow instructions that pop up from there

Clean up after computations: `./clean.sh`

### method 2:

Edit `launch-dask-cluster-conda.pbs` and adjust the header with the desired number of computational nodes.
For 8 nodes for example:
```
#PBS -q mpi_8
#PBS -l select=8:ncpus=28:mem=100g
```
Then run:
```
qsub launch-dask-cluster-conda.pbs
./launch-jobqueue.sh
```

Follow instructions that pop up from there

Once you are done computing, kill the `jlab.pbs` and `sample_dask_pbs` jobs.

Clean up after computations: `./clean.sh`

### method 3:

```
./launch-jobqueue.sh
```

Follow instructions that pop up from there.

Kill jobs once done with computations. 
`python kill.py` may be used.

Clean up after computations: `./clean.sh`



---
## misc

Simple SSH port forward from slyne:
```
ssh -N -L 8888:localhost:8888 slyne
```

