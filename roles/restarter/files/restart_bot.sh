#!/bin/bash
export RAILS_ENV=production
source /home/ops/.extend_bashrc
cd /home/ops/discord-recruitment-bot/current
if [ "`ruby bin/discord/bot.rb status | grep -e 'NOT running' -e 'No PIDs found'`" ]; then
  ruby bin/discord/bot.rb start
  echo -e "$(date)\tBot started."
else
  echo -e "$(date)\tBot running."
fi
