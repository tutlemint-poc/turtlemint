*** Settings ***
Resource          ../Global/super.robot
Resource          ../Global/global_variables.robot

*** Test Cases ***
TC01 Creating Health Policy
    Launch Browser and Navigate to URL    ${URL}    ${BROWSER_NAME}
    ${policy_data}=    Read TestData From Excel    TC_01    policy
    Select type of insurance    ${policy_data}[insurance type]
    Select gender    ${policy_data}[gender]
    Who would you like to insure    ${policy_data}[members to be insured]
    What is their age    ${policy_data}[age]
    Are you planning to have kids    ${policy_data}[planning to have kids]
    Does any of the member have any disease    ${policy_data}[member have any disease]
    What is your pincode    ${policy_data}[pincode]
    Your prefered hospital
    What is your income bracket    ${policy_data}[income bracket]
    ${name}=    Generate Random String    10
    Save your quote now    ${name}    ${policy_data}[mobile]    ${policy_data}[email]
    