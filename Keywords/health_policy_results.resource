*** Settings ***
Resource          ../Global/super.robot

*** Keywords ***
Get cover amount from policy result header
    Wait Until Element Is Visible    ${healthresult.header.coveramount}    ${MEDIUM_WAIT}    Cover amount is not displayed in health policy result page
    ${cover_amount}=    GetText    ${healthresult.header.coveramount}
    ${cover_amount}    Convert To Integer    ${cover_amount}
    ${cover_amount_lakhs}    Evaluate    ${cover_amount}*${100000}
    [Return]    ${cover_amount_lakhs}

Change the cover amount
    [Arguments]    ${cover_amount}
    Click Element    ${healthresult.dropdown.button.coveramount}
    Wait Until Element Is Visible    ${healthresult.dropdown.list.coveramount}    ${MEDIUM_WAIT}    Cover amount dropdown is not displayed.
    ${loc_dropdown_covervalue}    Update Dynamic Xpath    ${healthresult.dropdown.select.coveramount}    ${cover_amount}
    Click Element    ${loc_dropdown_covervalue}

Filter By Insurer
    [Arguments]    ${insurer_name}
    Wait Until Element Is Visible    ${healthresult.dropdown.button.insurer}    ${MEDIUM_WAIT}    Select insure drop down is not displayed.
    Click Element    ${healthresult.dropdown.button.insurer}
    Wait Until Element Is Visible    ${healthresult.dropdown.list.insurer}
    ${loc_dropdown_selectinsurer}    Update Dynamic Xpath    ${healthresult.dropdown.select.insurer}    ${insurer_name}
    Click Element    ${loc_dropdown_selectinsurer}

Check the cover amount in policy results
    [Arguments]    ${given_cover_amount}    ${policy_results_data}
    ${threshold_amount}    Set Variable    ${given_cover_amount}+${20000}
    ${policy_count}    Get Length    ${policy_results_data}
    FOR    ${key}    IN    @{policy_results_data.keys()}
        ${act_cover_amount}    Set Variable    ${policy_results_data}[${key}][cover_amount]
        IF    ${act_cover_amount} > ${threshold_amount}
        ${plan_name}    Set Variable    ${policy_results_data}[${key}][plan_name]
        Run Keyword And Continue On Failure    Fail    ${plan_name} cover amount is more than the selected cover amount. Cover Amount displayed: ${act_cover_amount}
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

Wait for Policy Results to displayed
    Comment    Page Should Contain Element    ${healthresult.page.data.ready}
    Wait Until Element Is Visible    ${healthresult.page.data.ready}    ${SHORT_WAIT}
    Wait Until Element Is Not Visible    ${healthresult.page.data.ready}    ${LONG_WAIT}
    Capture Page Screenshot

Wait for Policy Filter Results to displayed
    Run Keyword And Ignore Error    Wait Until Element Is Not Visible    ${healthresult.page.filter.ready}    20s
