*** Settings ***
Resource          ../Global/super.robot
Resource          ../Global/global_variables.robot

*** Test Cases ***
TC01 Quote For Health Policy and Check Cover Amount
    [Documentation]    Quote Health Policy
    ...    Change the Cover amount
    ...    Check the policies displayed matches seclect cover amount
    Launch Browser and Navigate to URL    ${URL}    ${BROWSER_NAME}
    ${policy_data}=    Read TestData From Excel    TC_01    health_policy
    Create a Health Policy    ${policy_data}
    Wait for Policy Results to displayed
    Change the cover amount    10
    Wait for Policy Results to displayed
    ${cover_amount}    Get cover amount from policy result header
    ${policy_results}    CustomLibrary.Get Health Policy Results
    Check the cover amount in policy results    ${cover_amount}    ${policy_results}
    [Teardown]    Close Browser

TC02 Quote For Health Policy and Filter By Insurer
    [Documentation]    Quote Health Policy
    ...    Filter By Insurer
    ...    Get Policy Name whoes claim settlement is less than 90%
    ...    Get Policy Name whoes premiun amount is morethan 2% of cover amount
    Launch Browser and Navigate to URL    ${URL}    ${BROWSER_NAME}
    ${policy_data}=    Read TestData From Excel    TC_02    health_policy
    Create a Health Policy    ${policy_data}
    Wait for Policy Results to displayed
    ${policy_results}    CustomLibrary.Get Health Policy Results
    Get Policy Name whoes claim settlement is less than 90%    ${policy_results}
    Get Policy Name whoes premiun amount is morethan 2% of cover amount    ${policy_results}
    Filter By Insurer    ${INSURER}
    Wait for Policy Filter Results to displayed
    ${policy_results}    CustomLibrary.Get Health Policy Results
    Check the Filtered Insurance details are displayed    ${INSURER}    ${policy_results}
    [Teardown]    Close Browser

TC_03 Quote for Health Policy and Compare
    Launch Browser and Navigate to URL    ${URL}    ${BROWSER_NAME}
    ${policy_data}=    Read TestData From Excel    TC_03    health_policy
    Create a Health Policy    ${policy_data}
    Wait for Policy Results to displayed
    ${policy_results}    CustomLibrary.Get Health Policy Results
    ${policy_one}    Set Variable    2
    ${policy_two}    Set Variable    3
    Select Two Policies and click on compare button    ${policy_one}    ${policy_two}
    ${compare_policy_details}    Read plan details in compare page    1
    ${results_policy_details}=    Evaluate     ${policy_results}.get(${policy_one})
    Check policy details in results and compare page     ${results_policy_details}    ${compare_policy_details}
    ${compare_policy_details}    Read plan details in compare page    2
    ${results_policy_details}=    Evaluate     ${policy_results}.get(${policy_two})
    Check policy details in results and compare page    ${results_policy_details}    ${compare_policy_details}
    [Teardown]    Close Browser

TC_04 Quote for Life Policy and Select Riders
    Launch Browser and Navigate to URL    ${URL}    ${BROWSER_NAME}
    ${policy_data}=    Read TestData From Excel    TC_02    life_policy
    Create a Life Policy    ${policy_data}
    Wait for life policy results to display
    Close Pop up Message
    Comment    Check the default payment frequency displayed
    ${act_payment_frequency}    Get payment frequency from policy result
    Should Be Equal As Strings    ${DEFAULT_PAYMENT_FREQUENCY}    ${act_payment_frequency}    Check default Payment Frequency
    Comment    Check the sum assured amount displayed in policy matches selected amount
    ${exp_sum_assured}    Set Variable    ${policy_data}[assured_amount]
    ${act_sum_assured}    Get sum assured from policy result
    Should Be Equal As Strings    ${exp_sum_assured}    ${act_sum_assured}    Sum assured displayed for policy should be matching with the selected policy amount
    Check premium amount on selecting rider    ${policy_data}[select_riders]
    [Teardown]    Close Browser
