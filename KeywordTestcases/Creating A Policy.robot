*** Settings ***
Resource          ../Global/super.robot
Resource          ../Global/global_variables.robot

*** Test Cases ***
TC01 Quote For Health Policy and Check Cover Amount
    Launch Browser and Navigate to URL    ${URL}    ${BROWSER_NAME}
    ${policy_data}=    Read TestData From Excel    TC_01    policy
    Create a Health Policy    ${policy_data}
    Change the cover amount    10
    Sleep    5s
    ${cover_amount}    Get cover amount from policy result header
    ${policy_results}    CustomLibrary.Get Health Policy Results
    Check the cover amount in policy results    ${cover_amount}    ${policy_results}
    Comment    Check the Filtered Insurance details are displayed    Manipal Cigna Health Insurance    ${policy_results}
    [Teardown]    Close All Browsers

TC02 Quote For Health Policy and Filter By Insurer
    Launch Browser and Navigate to URL    ${URL}    ${BROWSER_NAME}
    ${policy_data}=    Read TestData From Excel    TC_02    policy
    Create a Health Policy    ${policy_data}
    Wait for Policy Results to displayed
    ${policy_results}    CustomLibrary.Get Health Policy Results
    Filter By Insurer    Manipal Cigna Health Insurance
    Wait for Policy Filter Results to displayed
    ${policy_results}    CustomLibrary.Get Health Policy Results
    Check the Filtered Insurance details are displayed    Manipal Cigna Health Insurance    ${policy_results}
