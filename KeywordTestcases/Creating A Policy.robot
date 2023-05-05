*** Settings ***
Resource          ../Global/super.robot
Resource          ../Global/global_variables.robot

*** Test Cases ***
TC01 Creating Health Policy
    Launch Browser and Navigate to URL    ${URL}    ${BROWSER_NAME}
    Select type of insurance    Health
    Select gender    Male
    Who would you like to insure    Self;Wife
    What is their age    Self-42 years;Wife-40 years
