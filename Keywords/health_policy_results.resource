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
