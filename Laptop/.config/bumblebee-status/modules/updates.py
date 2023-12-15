
# Author: 3urobeat (https://github.com/3urobeat)
# Description: Gets the amount of available package updates (+AUR). Click the module to see which packages can be updated (notification).
# Disclaimer: Needs 'checkupdates+aur' package from the AUR to work.

import os
import core.module
import core.widget

class Module(core.module.Module):
    @core.decorators.every(minutes=5) # only check every 5 min

    def __init__(self, config, theme):
        super().__init__(config, theme, core.widget.Widget(self.full_text))

        self.shownotification = False

        events = [
            {"type": "notification", "action": self.notify, "button": core.input.LEFT_MOUSE}
        ]

        for event in events:
            core.input.register(self, button=event["button"], cmd=event["action"])

    def notify(self, event):
        self.shownotification = True

        os.popen("notify-send checkupdates \"Checking available updates...\"") # send notification before checking when clicked so the user knows the click was recognized

    def full_text(self, widgets):
        packages    = os.popen("checkupdates").read().split("\n")
        count       = len(packages) - 1 # last field is always an empty string so we need to subtract it

        # show notification with updateable packages when clicked
        if self.shownotification:
            if count == 0: # show different message if no updates were found
                os.popen("notify-send checkupdates \"No available updates found.\"")
            else:
                packagesstr = "\n".join(packages)

                os.popen(f"notify-send checkupdates \"{packagesstr}\"")

            self.shownotification = False # reset

        return " " + str(count)
