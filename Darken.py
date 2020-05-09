#!/usr/bin/env python3.7

import asyncio
import iterm2
# This script was created with the "basic" environment which does not support adding dependencies
# with pip.
PROFILES=["Default"]

async def main(connection):
    dark_status = await get_dark_status()
    while True:
        new_dark_status = await get_dark_status()
        if new_dark_status != dark_status:
            print("updating status")
            print(dark_status)
            dark_status = new_dark_status
            await set_color(connection, dark_status)
        await asyncio.sleep(1)
    return

async def get_dark_status():
    proc = await asyncio.create_subprocess_shell(
        "defaults read -g AppleInterfaceStyle",
        stdout=asyncio.subprocess.PIPE,
        stderr=asyncio.subprocess.PIPE)

    stdout, stderr = await proc.communicate()
    dark = "Dark" in stdout.decode('utf-8')
    return dark

async def set_color(connection, dark_status):
    if dark_status:
        preset_name = "Solarized Dark"
    else:
        preset_name = "Solarized Light"
    print("Change to preset {}".format(preset_name))
    preset = await iterm2.ColorPreset.async_get(connection, preset_name)
    for partial in (await iterm2.PartialProfile.async_query(connection)):
        if partial.name in PROFILES:
            await partial.async_set_color_preset(preset)

# This instructs the script to run the "main" coroutine and to keep running even after it returns.
iterm2.run_forever(main)
