# Open Point-dendrometer
A point dendrometer for small trunks and branches of tropical trees
![dendrometer](dendro.jpg)

## Objectives
Build a high precision point dendrometer to daily variations in water status and seasonnal growth of trees. 
There are already designs for point dendrometers on the market. Unfortunately most of them are based on a screw design and their linearity is sub-par. We choose to overcome these issues by inspiring ourselves on previous designs that use rods instead ([PepiPiaf](https://piaf.clermont.hub.inrae.fr/methodes-et-modeles/pepipiaf)) and by selecting high quality LVDT sensors.

## Hardware
### Mechanics
![Render of dendrometer](render_3D.png)

The build is based on a 3D printed holder and carbon-fiber rods. The 3D printed holder gives us the ease of fabrication, ease of prototyping and low-cost that makes it possible to build a large number of said dendrometers for a reasonnable price. The carbon-fiber rods give us a good temperature response of the dendrometer due to their low expansion coefficient.

The branch/trunk holder and lvdt holder 3D models are generated using [OpenScad](https://openscad.org/) and the [BOSL2](https://github.com/BelfrySCAD/BOSL2) library. The scripts can be found in the openscad-files folder. Openscad is an open-source software can be installed on any operating system. This means that the holders are parametrisable to your own case. This means you can adapt the model to the branch/truk diameter of your use case. This is a big adavantage of 3D printed holders. Once you have generated the 3D models you can export the STL files. 

The holders are meant to be printed in glass fiber PETG filament at 0.25mm layer height with a 0.6mm nozzle. The filament is the [Nanovia GF-UV PETG](https://nanovia.tech/en/ref/nanovia-petg-gf-uv/). The designs here were printed using a Prusa Mk4 and by drying the filament at 60°C for 12h (important !).

### Electronics
#### Linear potentiometer
The linear potentiometer that we use has 0.5% linearity and includes the spring (assuring contact) inside its body. It comes in a practical package around which the 3D printed holder is designed. The reference is BT404 and it can be found [here](https://www.mouser.fr/ProductDetail/858-404R10KL.5).
#### ADC
To read the output of the linear potentiometer we use the ADS1115 ADC. It has 16 bit precision that allows us to have a resolution of around 0.2µm (12.7mm of travel divided by 16 bits). This is of course overkill but a resolution of 1µm is useful when follwoing intra-daily varaitions of stem diameter.
#### Micro-controller
To read the ADC outputs we use a Pi-Pico running micropython. This is meant to be interfaceable with our own brand of ModBus network that we developped for instrumented sites (see [here](https://github.com/ivancornut/ecophys-modbus)).

## Calibration
### Calibration of the LVDT
To fast-calibrate the LVDT sensor we use a caliper and a small code that reads the outputs of the ADC connected to the LVDT. The procedures, codes and example datasets to do this operation cab be found in the [/Calibration](/Calibration) folder. 
The picture below shows an example of caliper values versus ADC outputs:

![calibration](/Calibration/calib.png). 

### Temperature response of the dendrometer
For calibration we use an aluminium rod with a known thermal expansion coefficient in a heating oven. By heating the whole setup we are able to calculate the deviation of the sensor due to thermal effects and calculate a linear correction to apply in the field. The code can be found [here](/Calibration_temp/calibration_temperature.ipynb). 
The graph below is the results when using our first prototype of the device:

![temperature calibration](/Calibration_temp/calib.png). 
