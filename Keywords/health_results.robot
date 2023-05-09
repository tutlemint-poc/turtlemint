*** Settings ***
Resource          ../Global/super.robot

*** Keywords ***
Check the cover amount in policy results
    [Arguments]    ${given_cover_amount}    ${policy_results_data}
    ${threshold_amount}    Set Variable    ${given_cover_amount}+${50000}
    ${policy_count}    Get Length    ${policy_results_data}
    FOR    ${key}    IN    @{policy_results_data.keys()}
        ${act_cover_amount}    Set Variable    ${policy_results_data}[${key}][cover_amount]
        IF    ${act_cover_amount} > ${threshold_amount}
        ${plan_name}    Set Variable    ${policy_results_data}[${key}][plan_name]
        Run Keyword And Continue On Failure    Fail    ${plan_name} cover amount is more than the selected cover amount
    END
    END

Check the Filtered Insurance details are displayed
    [Arguments]    ${filtered_insurer_name}    ${policy_results_data}
    ${exp_client_code}    Get Company Code    ${CLIENT_CODE}    ${filtered_insurer_name}
    ${policy_count}    Get Length    ${policy_results_data}
    FOR    ${key}    IN    @{policy_results_data.keys()}
        ${act_insurer_code}    Set Variable    ${policy_results_data}[${key}][client_name]
        Run Keyword And Continue On Failure    Should Be Equal As Strings    ${exp_client_code}    ${act_insurer_code}
    END

Check premium amount details
    [Arguments]    ${policy_results_data}
    ${policy_count}    Get Length    ${policy_results_data}
    FOR    ${key}    IN    @{policy_results_data.keys()}
        ${cover_amount}    Set Variable    ${policy_results_data}[${key}][cover_amount]
        ${total_premium}    Set Variable    ${policy_results_data}[${key}][total_premium]
    ${EMPTY}
        Run Keyword And Continue On Failure    Should Be Equal As Strings    ${exp_client_code}    ${act_insurer_code}
    END
