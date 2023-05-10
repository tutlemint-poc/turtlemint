*** Settings ***
Library           SeleniumLibrary
Resource          global_variables.robot
Resource          ../Keywords/common.resource
Library           String
Resource          ../ObjectRepository/or_home.robot
Resource          ../Keywords/health_policy.resource
Resource          ../ObjectRepository/or_healthprofile.robot
Library           Collections
Library           ../Library/CustomLibrary.py
Resource          ../ObjectRepository/or_healthresults.robot
Library           CustomLibrary
Resource          ../Keywords/life_policy.resource
Resource          ../ObjectRepository/or_lifeprofile.robot
