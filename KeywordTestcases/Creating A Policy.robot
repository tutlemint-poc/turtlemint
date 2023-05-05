*** Settings ***
Resource          ../Global/super.robot
Resource          ../Global/global_variables.robot

*** Test Cases ***
TC01 Creating Health Policy
    Launch Browser and Navigate to URL    ${url}    gc
    Select type of insurance
    Select gender
