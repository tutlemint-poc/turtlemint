*** Settings ***
Resource          ../Global/super.robot
Resource          ../Global/global_variables.robot

*** Test Cases ***
TC01 Creating Health Policy
    Launch Browser and Navigate to URL    ${url}    gc
    Select type of insurance
    Select gender
    Who would you like to insure
    Click on next
    What is their age    spouse    40
    What is their age    self    42
    Click on next
