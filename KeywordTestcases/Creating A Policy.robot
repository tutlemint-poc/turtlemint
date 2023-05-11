*** Settings ***
Resource          ../Global/super.robot
Resource          ../Global/global_variables.robot

*** Test Cases ***
TC01 Quote For Health Policy and Check Cover Amount
    Launch Browser and Navigate to URL    ${URL}    ${BROWSER_NAME}
    ${policy_data}=    Read TestData From Excel    TC_01    policy
    Create a Health Policy    ${policy_data}
    Change the cover amount    10
    Wait for Policy Results to displayed
    ${cover_amount}    Get cover amount from policy result header
    ${policy_results}    CustomLibrary.Get Health Policy Results
    Check the cover amount in policy results    ${cover_amount}    ${policy_results}
    Comment    Check the Filtered Insurance details are displayed    Manipal Cigna Health Insurance    ${policy_results}
    [Teardown]    Close All Browsers

TC02 Quote For Health Policy and Filter By Insurer
    [Documentation]    Quote Health Policy
    ...    Filter By Insurer
    ...    Get Policy Name whoes claim settlement is less than 90%
    ...    Get Policy Name whoes premiun amount is morethan 2% of cover amount
    Launch Browser and Navigate to URL    ${URL}    ${BROWSER_NAME}
    ${policy_data}=    Read TestData From Excel    TC_02    policy
    Create a Health Policy    ${policy_data}
    Wait for Policy Results to displayed
    ${policy_results}    CustomLibrary.Get Health Policy Results
    Get Policy Name whoes claim settlement is less than 90%    ${policy_results}
    Get Policy Name whoes premiun amount is morethan 2% of cover amount    ${policy_results}
    Filter By Insurer    Manipal Cigna Health Insurance
    Wait for Policy Filter Results to displayed
    ${policy_results}    CustomLibrary.Get Health Policy Results
    Check the Filtered Insurance details are displayed    Manipal Cigna Health Insurance    ${policy_results}

TC03 Quote for Health Policy and Compare
    Launch Browser and Navigate to URL    ${URL}    ${BROWSER_NAME}
    ${policy_data}=    Read TestData From Excel    TC_02    policy
    Create a Health Policy    ${policy_data}
    Wait for Policy Results to displayed

sam
    ${phone}    get_phone_number
    Log    ${phone}
