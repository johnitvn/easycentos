#!/bin/sh
if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user" 2>&1
  exit 1
else
  rm -rf /root/.easycentos
  mkdir /root/.easycentos
  cp -r Libraries /root/.easycentos
  cp easycentos /root/.easycentos
  chmod +x /root/.easycentos/*
  chmod +x /root/.easycentos/*/*
  echo "export PATH=$PATH:/root/.easycentos" >> /root/.profile
  source /root/.profile
fi