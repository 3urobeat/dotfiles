
# Author: 3urobeat (https://github.com/3urobeat)
# Description: Gets the utilization (load), temperature & vram usage from nvidia-settings to be used as module for bumblebee-status.
#
# Parameter: gpu.format -> The script will replace the keywords in your format string with the corresponding values. Keywords: {load}, {temp} & {vram}

import os
import sys
import core.module
import core.widget

class Module(core.module.Module):
    def __init__(self, config, theme):
        super().__init__(config, theme, core.widget.Widget(self.full_text))

    def full_text(self, widgets):
        # set defaults for parameters
        format = self.parameter("format", "LOAD {load} TEMP {temp} VRAM {vram}")

        # get load and temperature from 'nvidia-settings'
        loadresult = os.popen("nvidia-settings -q GPUUtilization -t").read() # output: "graphics=27, memory=13, video=0, PCIe=2"
        tempresult = os.popen("nvidia-settings -q GPUCoreTemp -t").read() # output: "39\n39"

        # retrieve values from response and add unit
        graphicsload = str(loadresult.split(", ")[0].replace("graphics=", "")) + "%" # output after splitting: ['graphics=27', 'memory=12', 'video=0', 'PCIe=3\n']
        vramload     = str(loadresult.split(", ")[1].replace("memory=", "")) + "%"
        temp         = str(tempresult.split("\n")[0]) + "°C" # output after splitting: ['39', '39', '']

        # replace words in format with values
        format = format.replace("{load}", graphicsload)
        format = format.replace("{vram}", vramload)
        format = format.replace("{temp}", temp)

        # print result
        return format
