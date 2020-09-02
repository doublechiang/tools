#!/usr/bin/env python3

import sys
import subprocess
from datetime import datetime

class IpmiReading:
    def getSdrCpu(self):
        sensor_cpu0=sensor_cpu1=0
        cmd = 'sdr | grep -i cpu'
        if (self.host):
            cmd = '-H ' + self.host + ' -U ' + self.username + ' -P ' + self.password + ' ' + cmd
        cmd = 'ipmitool ' + cmd

        p = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
        for line in p.stdout:
            line = str(line, 'utf-8')
            key=line.split()[0]
            if key == 'Temp_CPU0':
                sensor_cpu0 = int(float(line.split()[2]))
            if key == 'Temp_CPU1':
                sensor_cpu1 = int(float(line.split()[2]))
        retval = p.wait()
        return (sensor_cpu0, sensor_cpu1)

    def getSensorCpu(self):
        sdr_cpu0=sdr_cpu1=0
        cmd = 'sensor | grep -i cpu'
        if (self.host):
            cmd = '-H ' + self.host + ' -U ' + self.username + ' -P ' + self.password + ' ' + cmd
        cmd = 'ipmitool ' + cmd
        p = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
        for line in p.stdout:
            line = str(line, 'utf-8')
            key=line.split()[0]
            if key == 'Temp_CPU0':
                sdr_cpu0 = int(float(line.split()[2]))
            if key == 'Temp_CPU1':
                sdr_cpu1 = int(float(line.split()[2]))
        retval = p.wait()
        return (sdr_cpu0, sdr_cpu1)
    def __init__(self, host=None, username=None, password=None):
        self.host=host
        self.username=username
        self.password=password

if __name__ == "__main__":
    host=username=password=None
    if len(sys.argv) == 4:
        host=sys.argv[1]
        username=sys.argv[2]
        password=sys.argv[3]
    conn = IpmiReading(host, username, password)

    while True:
        sensor_reading = conn.getSensorCpu()
        sdr_reading = conn.getSdrCpu()
        if sdr_reading == sensor_reading:
            print("%s, Sensor %d %d, Sdr %d %d " % (datetime.now(), sensor_reading[0], sensor_reading[1], sdr_reading[0], sdr_reading[1]))
        else:
            delta = abs(sdr_reading[0] - sensor_reading[0])
            if abs(sdr_reading[1] - sensor_reading[1]) > delta:
                delta = abs(sdr_reading[1] - sensor_reading[1])
            print("mismatch!, %s, Sensor %d %d, Sdr %d %d, delta=%d" % (datetime.now(), sensor_reading[0], sensor_reading[1], sdr_reading[0], sdr_reading[1], delta))





