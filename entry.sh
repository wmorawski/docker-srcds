#!/bin/bash
if [[ -z "$SRCDS_TOKEN" ]]
then
  echo "You must give a SRCDS_TOKEN"
  exit 1
fi
/home/steam/steamcmd.sh +runscript /home/steam/csgo_update.txt
/home/steam/csgo/srcds_run -game csgo -console -usercon +app_update 740 validate +game_type 1 +game_mode 2 +mapgroup mg_allclassic +map de_mirage +sv_setsteamaccount $SRCDS_TOKEN -net_port_try 1