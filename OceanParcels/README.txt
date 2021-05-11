This folder contains the script needed for all trajectory simulations and a subfolder with outputs from
the simulations called "trajectory_data". Please see the "trajectory_data" subfolder for details
about the contents. The file/s located within this  folder contain the latest working script and outputs. 

Chapter 3:

The file "chapter3_simulation", "chapter_3_simulation_cyl" and "chapter_3_simulation_acc" are the python project files containing the script to run the current
version of the langrangian based simulations incorporating drag aspects into trajectory simulations.
This file is also used to run the simulations for passive particles by "switching on/off" certian
kernels and advections schemes. This must be manually set by the user for each simulation run, within
the execution code (provided the needed kernels have been cast). The  "chapter3_simulation" is for the 30day simulations with a single particle release, chapter_3_simulation_cyl is the script for testing the use of a different shape coefficient, and chapter_3_simulation_acc is the 30day simulations performed to investigate the role of eddies and vortices
in accumulating surface drift.

The current script creates data variables that can be extracted or interpolated from the underlying
hydrodynamic numerical model. The path the to latest outputs of the data files are: "data/trajectory_data",
Please see that folder README file for details about the associated .nc files.

The current variables available to work with are:

1) Latitude 
2) Longitude
3) Time
4) Distance
5) Age
6) Velocity (average velocity over time-step)

** To be added for chapter 4:

> Depth (an appropriate dataset is needed for this)
> Velocity (average velocity over time-step)
> Sinking kernel (sinks between a specified interval of time depending on season)


NOTE: The data for the underlying numerical model has not been added to this repo
due to the large file size. 
