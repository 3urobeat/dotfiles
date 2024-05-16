
# Author: 3urobeat (https://github.com/3urobeat)
# Description: Very simple uptime script that gets the output from 'uptime -p' for bumblebee-status.

import os
import core.module
import core.widget

class Module(core.module.Module):
    def __init__(self, config, theme):
        super().__init__(config, theme, core.widget.Widget(self.full_text))

    def full_text(self, widgets):
        uptimeout = os.popen("uptime -p").read().split("\n")
        return "↻︁ " + uptimeout[0]
