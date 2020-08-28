# frequency_meter
Проект для кита **Terasic DE1-SoC** с чипом **Altera Cyclone V**.  
Собран в среде **Quartus Prime 16.0**.  
В проекте осуществляется измерение частоты и обновление выводимого значения значения раз в секунду.  
## freq_m_module
В данной папке лежит отдельный Verilog-модуль, в котором реализован частотомер. Подробнее о функциях написано внутри файла "freq_m_module.v" в комментариях.  
Файлы, находящиеся внутри этой папки, необходимы для корректной работы модуля (библиотечные файлы счётчиков, применяющихся для подсчёта импульсов входящего сигнала).  
## with_SPI
В данной папке находится проект, включающий в себя **частотомер**, а также **вывод данных через SPI** на другое устройство (в проекте применялся BeagleBone Black). Значение частоты представляет собой 32-битный регистр, который передаётся в виде 4х 8-битных пакетов.