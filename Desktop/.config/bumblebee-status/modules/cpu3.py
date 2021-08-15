
# Author: 3urobeat (https://github.com/HerrEurobeat)
# Description: Gets the utilization (load) & temperature from 'mpstat' & 'sensors' to be used as module for bumblebee-status.
#
# Parameters: cpu3.format -> The script will replace the keywords in your format string with the corresponding values. Keywords: {load} & {temp}
#             cpu3.chip   -> Provide the chip flag with the sensor of your CPU temp as String. Be sure to run 'sudo sensors-detect' in order to find and probe your CPU temp sensor. For me (AMD Ryzen) it is 'k10temp-pci-00c3'.

import os
import sys
import core.module
import core.widget

class Module(core.module.Module):
    def __init__(self, config, theme):
        super().__init__(config, theme, core.widget.Widget(self.full_text))

    def full_text(self, widgets):
        # set defaults for parameters
        format = self.parameter("format", "LOAD {load} TEMP {temp}")
        chip   = self.parameter("chip", "")

        # get load and temperature
        mpresultresult = os.popen("mpstat 2 1").read().split("\n") # output: 
        sensorsresult  = os.popen(f"sensors -u {chip}").read().split("\n") # output: 

        # retrieve idle value from output, round the number, calculate load (100 - idle) and format string
        cpuaverage = mpresultresult[len(mpresultresult) - 2].split(" ")
        cpuidle    = float(100 - float(cpuaverage[len(cpuaverage) - 1])).__round__(2)
        cpuload    = str(cpuidle) + "%"

        # get chip temp
        cputemp1in = [e for e in sensorsresult if 'temp1_input:' in e][0] # get temp1_input for this chip
        cputemp    = str(float(cputemp1in.replace("  temp1_input: ", "")).__round__(2)) + "°C"

        # replace words in format with values
        format = format.replace("{load}", cpuload)
        format = format.replace("{temp}", cputemp)

        # print result
        return format
