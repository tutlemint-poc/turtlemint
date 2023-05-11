*** Settings ***
Resource          ../Global/super.robot
Resource          ../Global/global_variables.robot

*** Test Cases ***
TC01 Quote For Health Policy and Check Cover Amount
    Launch Browser and Navigate to URL    ${URL}    ${BROWSER_NAME}
    ${policy_data}=    Read TestData From Excel    TC_01    health_policy
    Create a Health Policy    ${policy_data}
    Change the cover amount    10
    Wait for Policy Results to displayed
    Wait for Policy Results to displayed
    ${cover_amount}    Get cover amount from policy result header
    ${policy_results}    CustomLibrary.Get Health Policy Results
    Check the cover amount in policy results    ${cover_amount}    ${policy_results}
    Comment    Check the Filtered Insurance details are displayed    Manipal Cigna Health Insurance    ${policy_results}
    [Teardown]    Close Browser

TC02 Quote For Health Policy and Filter By Insurer
    [Documentation]    Quote Health Policy
    ...    Filter By Insurer
    ...    Get Policy Name whoes claim settlement is less than 90%
    ...    Get Policy Name whoes premiun amount is morethan 2% of cover amount
    Launch Browser and Navigate to URL    ${URL}    ${BROWSER_NAME}
    ${policy_data}=    Read TestData From Excel    TC_01    health_policy
    Create a Health Policy    ${policy_data}
    Wait for Policy Results to displayed
    ${policy_results}    CustomLibrary.Get Health Policy Results
    Get Policy Name whoes claim settlement is less than 90%    ${policy_results}
    Get Policy Name whoes premiun amount is morethan 2% of cover amount    ${policy_results}
    Filter By Insurer    Manipal Cigna Health Insurance
    Wait for Policy Filter Results to displayed
    ${policy_results}    CustomLibrary.Get Health Policy Results
    Check the Filtered Insurance details are displayed    Manipal Cigna Health Insurance    ${policy_results}
    [Teardown]    Close Browser

TC_03 Quote for Health Policy and Compare
    Launch Browser and Navigate to URL    ${URL}    ${BROWSER_NAME}
    ${policy_data}=    Read TestData From Excel    TC_03    health_policy
    Create a Health Policy    ${policy_data}
    Wait for Policy Results to displayed

TC04 Quote for Life Policy and Filter By Riders
    Launch Browser and Navigate to URL    ${URL}    ${BROWSER_NAME}
    ${policy_data}=    Read TestData From Excel    TC_01    life_policy
    Create a Life Policy    ${policy_data}
    Wait for life policy results to display
    Close Pop up Message
    Get payment frequency from policy result    ${policy_data}[payment_frequency]
    Get sum assured from policy result    ${policy_data}[assured_amount]
    Check premium amount    ${policy_data}[select_riders]
