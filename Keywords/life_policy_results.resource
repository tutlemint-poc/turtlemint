*** Settings ***
Resource          ../Global/super.robot

*** Keywords ***
Wait for life policy results to display
    Run Keyword And Ignore Error    Wait Until Element Is Visible    ${liferesults.page.data.ready}    ${SHORT_WAIT}
    Run Keyword And Ignore Error    Wait Until Element Is Not Visible    ${liferesults.page.data.ready}    ${LONG_WAIT}
    Capture Page Screenshot

Close Pop up Message
    ${status}    Run Keyword And Return Status    Wait Until Element Is Visible    ${liferesults.message}    ${SHORT_WAIT}
    Run Keyword If    ${status}==True    Click Element    ${liferesults.message}

Get payment frequency from policy result
    Wait Until Element Is Visible    ${liferesults.header.paymentfrequency}    ${MEDIUM_WAIT}    Payment frequency is not displayed in life policy page
    ${payment_frequency}=    Get Text    ${liferesults.header.paymentfrequency}
    [Return]    ${payment_frequency}

Get sum assured from policy result
    Wait Until Element Is Visible    ${liferesults.header.sumassured}    ${MEDIUM_WAIT}    Sum assured is not displayed is Life policy page
    ${sum_assured}=    Get Text    ${liferesults.header.sumassured}
    ${sum_assured}    Remove String    ${sum_assured}    ₹
    [Return]    ${sum_assured}

Check premium amount on selecting rider
    [Arguments]    ${select_rider}
    Wait Until Element Is Visible    ${liferesults.header.premiumamount}    ${MEDIUM_WAIT}    Premium amount should be displayed in life policy page.
    ${premium_amount}=    Get Text    ${liferesults.header.premiumamount}
    ${premium_amount}    Convert displayed amount to integer    ${premium_amount}
    ${select_rider}=    Update Dynamic Xpath    ${liferesults.page.riders}    ${select_rider}
    Wait Until Element Is Visible    ${select_rider}    ${MEDIUM_WAIT}    Check the rider is displayed to select
    Click Element    ${select_rider}
    Sleep    5s
    Capture Page Screenshot
    ${addon_premium}=    Get Text    ${liferesults.header.premiumamount}
    ${addon_premium}    Convert displayed amount to integer    ${addon_premium}
    Run Keyword If    ${addon_premium}<=${premium_amount}    FAIL    Premium amount not increased on selecting rider
