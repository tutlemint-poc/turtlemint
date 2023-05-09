*** Settings ***
Library           SeleniumLibrary
Library           String
Library           Collections
Library           ../Library/CustomLibrary.py
Resource          global_variables.robot
Resource          ../Keywords/common.resource
Resource          ../ObjectRepository/or_home.robot
Resource          ../Keywords/health_policy.resource
Resource          ../ObjectRepository/or_healthprofile.robot
Resource          ../Keywords/health_policy_results.resource
Resource          ../ObjectRepository/or_healthresults.robot
Resource          ../ObjectRepository/or_healthresults.robot
Resource          ../Keywords/health_results.robot
