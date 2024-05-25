from machine import I2C, Pin, Timer
from time import sleep
import ads1x15

p0 = Pin(6, Pin.OUT)
p0.value(0)

addr = 72
gain = 1
i2c = I2C(0, sda=Pin(0), scl=Pin(1))  # Correct I2C pins for RP2040
try:
    ads = ads1x15.ADS1115(i2c, addr, gain)
except:
    print("no access to device")

while True:
    p0.on()
    sleep(0.1)
    value1 = 0
    value2 = 0
    for i in range(0,10):
        value1 = value1 + ads.read(1,0)/10
        value2 = value2 + ads.read(1,1)/10
    sleep(0.1)
    p0.off()
    voltage1 = ads.raw_to_v(value1)
    voltage2 = ads.raw_to_v(value2)
    print(voltage1, voltage2, voltage2/voltage1)
    sleep(0.5)