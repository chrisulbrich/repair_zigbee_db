# Repair script for broken zigbee2mqtt database

After an unclean shutdown the zigbee2mqtt database.db file can contain NULL bytes at the end what prevents zigbee2mqtt to start up.
This scrip removes such NULL bytes if present at boot time.
