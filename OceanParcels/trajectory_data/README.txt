This folder contains all the data and graphical outputs created with the "kelp_float.ipynb" project script
(see OceanParcels folder). The current graphical are:

"PassiveFloat_A/B" : Output of passive particles with average zonal velocity plotted as a vector. No "behaviour"
                     incorporated.
"KelpFloat_A/B"    : Output of kelp particles with average zonal velocity plotted as a vector. Aspects
                     relating. Kernels for "behaviour" of particles (i.e hydrodynamic drag, wind-drag...)
                     have been incorporated. Behaviour incorporated is dependent on the user.

The contents of this folder will be updated after simulations have been run and tested. The relevant .nc files contain
all trajectory data over the time-period for each simulation type (passive or kelp particle). 
The current variables available to work with are:

1) Latitude 
2) Longitude
3) Time
4) Distance

Variables can be added via creating a new particle class with custom variables. What is able to be measured (i.e what
custom variable you can add) is all dependent on the resolution of the underlying numerical model used in 
the trajectory simulations. 