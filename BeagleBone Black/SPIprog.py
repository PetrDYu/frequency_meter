#!/usr/bin/python3

## Перед первым запуском необходимо запустить SPI_init.py

import time
import Adafruit_BBIO.SPI as SPI # Библиотека для работы с SPI на BeagleBone Black

# Настройка SPI
spi = SPI.SPI(1,0)  # Используем SPI 1 (он же SPI 0, нумерация с 1), cheap select 0
spi.msh = 16000000  # частота SPI
spi.mode = 0  # По-умолчанию: 1

try:
    while True:
        time.sleep(1) # Задержка в 1 секунду
        freq = spi.readbytes(4) # Чтение 4 байт 32-битного значения частоты
        print('freq =', freq[0] + freq[1] * (2 ** 8) + freq[2] * (2 ** 16) + freq[3] * (2 ** 24), '\n')
except KeyboardInterrupt: #отработка прерывания программы при помощи CTRL+C
    spi.close
    print(' Programm finished')
