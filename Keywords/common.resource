*** Settings ***
Resource          ../Global/super.robot

*** Keywords ***
Launch Browser
    [Arguments]    ${browser_name}    ${url}
    Run Keyword If    '${browser_name}'=='Chrome' or '${browser_name}'=='chrome' or '${browser_name}'=='gc'    Open Browser    ${url}    gc
    Run Keyword If    '${browser_name}'=='Firefox' or '${browser_name}'=='firefox' or '${browser_name}'=='ff'    Open Browser    ${url}    Firefox

Launch Browser and Navigate to URL
    [Arguments]    ${url}    ${browser_name}
    ${session}    Run Keyword And Return Status    Get Session Id
    Run Keyword If    ${session}==True    Go To    ${url}
    ...    ELSE    Launch Browser    ${browser_name}    ${url}
    Maximize Browser Window

Click on Next button
    Click Element    ${common.button.next}

Click on back
    Wait Until Element Is Visible    ${buttons.back}
    Click Element    ${buttons.back}

Select from dropdown
    [Arguments]    ${dropdown_labelname}    ${dropdown_value}
    ${loc_dropdown_name}    Update Dynamic Xpath    ${home.dropdown}    ${dropdown_labelname}
    Click Element    ${loc_dropdown_name}
    Comment    Wait for the drop down to open
    Wait Until Element Is Visible    ${home.dropdown.open}    ${MEDIUM_WAIT}    Drop down is not displayed
    ${loc_dropdown_value}    Update Dynamic Xpath    ${home.dropdown.value}    ${dropdown_value}
    Click Element    ${loc_dropdown_value}

Update Dynamic Xpath
    [Arguments]    ${locator}    ${text}
    ${new_locator}    Replace String    ${locator}    replaceText    ${text}
    [Return]    ${new_locator}

Select Checkbox
    [Arguments]    ${checkbox_name}
    ${loc_checkbox}    Update Dynamic Xpath    ${common.checkbox}    ${checkbox_name}
    Click Element    ${loc_checkbox}
