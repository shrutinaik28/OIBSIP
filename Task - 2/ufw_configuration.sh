#!/bin/bash

sudo ufw default deny incoming
sudo ufw default allow outgoing

sudo ufw allow ssh
sudo ufw deny http

sudo ufw allow https
sudo ufw allow 53

sudo ufw enable

sudo ufw status verbose
