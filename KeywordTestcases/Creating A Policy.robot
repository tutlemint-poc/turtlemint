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
    ${cover_amount}    Get cover amount from policy result header
    ${policy_results}    CustomLibrary.Get Health Policy Results
    Check the cover amount in policy results    ${cover_amount}    ${policy_results}
    Comment    Check the Filtered Insurance details are displayed    Manipal Cigna Health Insurance    ${policy_results}

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

TC03 Creating Life Policy
    Launch Browser and Navigate to URL    ${URL}    ${BROWSER_NAME}
    ${policy_data}=    Read TestData From Excel    TC_02    life_policy
    Create a Life Policy    ${policy_data}

TC04 Life Policy Filters
    Launch Browser and Navigate to URL    ${URL}    ${BROWSER_NAME}
    ${policy_data}=    Read TestData From Excel    TC_02    life_policy
    Create a Life Policy    ${policy_data}
    Check Pop up Message
    Get payment frequency from policy result
    Get sum assured from policy result

sample
    Comment    ${date_of_birth}    Set Variable    12-Sep-1999
    Comment    ${list_birthdate}    Split String    ${date_of_birth}    -
    Comment    ${day}    Set Variable    ${list_birthdate}[0]
    Comment    ${month}    Set Variable    ${list_birthdate}[1]
    Comment    ${year}    Set Variable    ${list_birthdate}[2]
    ${sample}    get_phone_number
    Log    ${sample}
