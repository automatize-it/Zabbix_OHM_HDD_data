# Zabbix OHM HDD data template

This repo contains Zabbix template and script for collecting data (currently temperature C only) on workstations with OS Windows (7+).
V 0.1 alpha. Works.
Template has autodiscover and contains prototypes with disk ID's and temperatures, along with temperature trigger prototype (>45 C by default).
Script uses Open Hardware Monitor https://openhardwaremonitor.org/ wich must run in background, normally or in service mode using NSSM https://nssm.cc or similiar. OHM posts data to WMIC, and script collects data from WMIC.

Usage:
> import template and add template to your hosts ;

> copy ohmGetHddData.cmd script to your Zabbix client user scripts dir ;

> add UserParameter from zabbix_agentd.conf.add to your zabbix_agentd.conf. Do not forget to restart Zabbix agent ;

> Enjoy.
