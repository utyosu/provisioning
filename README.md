# Setup

## OS

Ubuntu 18.04 LTS

## Infrastructure

Google Compute Engine

## Provisioning discord-bot

### Check

```
ansible-playbook -i inventories/production discord-bot.yml --diff --check
```

### Apply

```
ansible-playbook -i inventories/production discord-bot.yml --diff
```
