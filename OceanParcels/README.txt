This folder contains the script needed for all trajectory simulations. The file/s located within this
folder contain the latest working script. 

The file "kelp.float.ipynb" is the python project file containing the script to run the current
version of the langrangian based simulations incorporating drag aspects into numerical simulations.
This file is also used to run the simulations for passive particles by "switching on/off" certian
kernels and advections schemes. This must be manual set by the user for each simulation run within
the execution code (provided the needed kernels have been cast). 

The path the to latest outputs of the simulations are: "data/trajectory_data",
Please see that folder README file for details about the associated .nc files

NOTE: The data for the underlying numerical model has not been added to this repo
due to the large file size. 