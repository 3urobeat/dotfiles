
# Author: 3urobeat (https://github.com/3urobeat)
# Description: Gets the utilization (load), temperature and cpu fan speed from 'mpstat' & 'sensors' to be used as module for bumblebee-status.
#
# Parameters: cpu3.format     -> The script will replace the keywords in your format string with the corresponding values. You can also simply leave out keywords to not display them. Keywords: {load}, {temp} & {fan}
#             cpu3.chip       -> Provide the chip flag with the sensor of your CPU temp as String. Be sure to run 'sudo sensors-detect' in order to find and probe your CPU temp sensor. For me (AMD Ryzen) it is 'k10temp-pci-00c3' or 'thinkpad-isa-0000' on my Thinkpad.
#             cpu3.tempsensor -> If your PC uses a different sensor for the CPU temperature then you can provide it with this flag. Default is 'temp1_input'
#             cpu3.fansensor  -> If your PC uses a different sensor for the fan readout then you cna provide it with this flag. Default is 'fan1_input'

import os
import sys
import core.module
import core.widget

class Module(core.module.Module):
    def __init__(self, config, theme):
        super().__init__(config, theme, core.widget.Widget(self.full_text))

    def full_text(self, widgets):
        # set defaults for parameters
        format = self.parameter("format", "LOAD {load} TEMP {temp} FAN {fan}")
        chip   = self.parameter("chip", "")

        tempsensor = self.parameter("tempsensor", "temp1_input")
        fansensor  = self.parameter("fansensor", "fan1_input")

        # get load and temperature
        mpresultresult = os.popen("mpstat 2 1").read().split("\n") # output:
        sensorsresult  = os.popen(f"sensors -u {chip}").read().split("\n") # output:

        # retrieve idle value from output, round the number, calculate load (100 - idle) and format string
        cpuaverage = mpresultresult[len(mpresultresult) - 2].split(" ")
        cpuidle    = float(100 - float(cpuaverage[len(cpuaverage) - 1])).__round__(2)
        cpuload    = str(cpuidle) + "%"

        # get chip temp
        cputemp1in = [e for e in sensorsresult if f'{tempsensor}:' in e][0] # get temp1_input for this chip
        cputemp    = str(float(cputemp1in.replace(f"  {tempsensor}: ", "")).__round__(2)) + "°C"

        if "{fan}" in format: # only check if user wants to display it to prevent error when sensor does not exist
            fan1in = [e for e in sensorsresult if f'{fansensor}:' in e][0] # get fan1_input for this chip
            fan    = str(int(fan1in.replace(f"  {fansensor}: ", "").split(".")[0])) + " RPM" # get fan speed from value and discard anything behind the dot

            format = format.replace("{fan}", fan)

        # replace words in format with values
        format = format.replace("{load}", cpuload)
        format = format.replace("{temp}", cputemp)

        # print result
        return format
