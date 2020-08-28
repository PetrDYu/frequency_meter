#!/usr/bin/python3

import os

os.system('config-pin P9.17 spi_cs')
os.system('config-pin P9.18 spi')
os.system('config-pin P9.21 spi')
os.system('config-pin P9.22 spi_sclk')

print('\nSPI pins are set\n')
