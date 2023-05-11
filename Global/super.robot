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
Library           CustomLibrary
Resource          ../Keywords/life_policy.resource
Resource          ../ObjectRepository/or_lifeprofile.robot
Resource          ../ObjectRepository/or_liferesults.robot
Resource          ../Keywords/life_policy_results.resource
