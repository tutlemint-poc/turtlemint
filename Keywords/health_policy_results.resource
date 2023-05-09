*** Keywords ***
Get the default cover amount
    [Arguments]    ${cover_value}=${EMPTY}
    Wait Until Element Is Visible    ${health.header.coveramount}    ${MEDIUM_WAIT}    cover amount is not displayed.
    ${cover_amount}=    GetText    ${health.header.coveramount}
    Run Keyword If    '${cover_amount}'=='5 Lakhs'    Change the cover amount    ${cover_value}

Change the cover amount
    [Arguments]    ${cover_value}
    Click Element    ${healthresult.dropdown.cover}
    Wait Until Element Is Visible    ${healthresult.dropdown.cover}    ${MEDIUM_WAIT}    cover amount dropdown is not displayed.
    ${loc_dropdown_covervalue}    Update Dynamic Xpath    ${health.result.dropdown.covervalue}    ${cover_value}
    Click Element    ${loc_dropdown_covervalue}

Select the policy company name from filters
    [Arguments]    ${insuer_name}
    Wait Until Element Is Visible    ${health.results.dropdown.selectinsurer}    ${MEDIUM_WAIT}    select insure drop down is not displayed.
    Click Element    ${health.results.dropdown.selectinsurer}
    Wait Until Element Is Visible    ${health.dropdown.insurerlist}
    ${loc_dropdown_selectinsurer}    Update Dynamic Xpath    ${health.dropdown.selectinsurername}    ${insuer_name}
    Click Element    ${loc_dropdown_selectinsurer}

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
    ${exp_client_code}    CustomLibrary.Get Company Code    ${CLIENT_CODE}    ${filtered_insurer_name}
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
