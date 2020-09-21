This folder contains the script needed for all trajectory simulations. The file/s located within this
folder contain the latest working script. 

The file "kelp.float.ipynb" is the python project file containing the script to run the current
version of the langrangian based simulations incorporating drag aspects into trajectory simulations.
This file is also used to run the simulations for passive particles by "switching on/off" certian
kernels and advections schemes. This must be manually set by the user for each simulation run, within
the execution code (provided the needed kernels have been cast). 

The current script creates data variables that can be extracted or interpolated from the underlying
hydrodynamic numerical model. The path the to latest outputs of the data files are: "data/trajectory_data",
Please see that folder README file for details about the associated .nc files.

The current variables available to work with are:

1) Latitude 
2) Longitude
3) Time
4) Distance

** To be added:

> Depth (an appropriate dataset is needed for this)
> Age (time afloat at the end of simulation)
> Velocity (average velocity over time-step)
> Sinking kernel (sinks between a specified interval of time depending on season)
> Sinking rate kernel (particle behaviour of sinking kelp),

and more...



NOTE: The data for the underlying numerical model has not been added to this repo
due to the large file size. 