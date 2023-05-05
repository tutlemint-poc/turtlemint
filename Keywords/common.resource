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

Click on next
    Wait Until Element Is Visible    ${buttons.next}
    Click Element    ${buttons.next}

Click on back
    Wait Until Element Is Visible    ${buttons.back}
    Click Element    ${buttons.back}

Search and Select from dropdown
    [Arguments]    ${dropdown_id}    ${serach_age}
    ${updateddropdown_name}    UpdatedynamicXpath    ${dropdown.name}    ${dropdown_id}
    Wait Until Element Is Visible    ${updateddropdown_name}
    Click Element    ${updateddropdown_name}
    ${updateddropdown_search}    UpdatedynamicXpath    ${dropdown.search}    ${dropdown_id}
    Click Element    ${updateddropdown_search}
    Input Text    ${updateddropdown_search}    ${serach_age}
    ${updateddropdown.searchitem}    Format String    ${dropdown.searchitem}    ${dropdown_id}    ${serach_age}
    Wait Until Element Is Visible    ${updateddropdown.searchitem}
    Click Element    ${updateddropdown.searchitem}

UpdatedynamicXpath
    [Arguments]    ${locator}    ${text}
    ${new_locator}    Replace String    ${locator}    replaceText    ${text}
    [Return]    ${new_locator}

Select checkboxes
    [Arguments]    ${checkboxes_name}
    ${updated_value}    UpdatedynamicXpath    ${checkboxes.list}    ${checkboxes_name}
    Click Element    ${updated_value}
