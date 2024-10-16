#!/bin/bash

sim_path=/home/simulation/ICS2/simulation_vm/simulation/remote_io/modbus
sudo pkill python
sudo pkill simulation
"$sim_path"/../../simulation &
sudo python $sim_path/feed1.py &
sudo python $sim_path/feed2.py &
sudo python $sim_path/purge.py &
sudo python $sim_path/product.py &
sudo python $sim_path/tank.py &
sudo python $sim_path/analyzer.py &
