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
    [Arguments]    ${payment_freq}
    Wait Until Element Is Visible    ${liferesults.header.paymentfrequency}    ${MEDIUM_WAIT}    Payment frequency is not displayed in life policy page
    ${payment_frequency}=    Get Text    ${liferesults.header.paymentfrequency}
    Should Be Equal As Strings    ${payment_frequency}    ${payment_freq}

Get sum assured from policy result
    [Arguments]    ${assured_amount}
    Wait Until Element Is Visible    ${liferesults.header.sumassured}    ${MEDIUM_WAIT}    Sum assured is not displayed is Life policy page
    ${sum_assured}=    Get Text    ${liferesults.header.sumassured}
    ${new_sum_assured}=    Remove String    ${sum_assured}    ₹
    Should Be Equal As Strings    ${new_sum_assured}    ${assured_amount}

Check premium amount
    [Arguments]    ${select_riders}
    Wait Until Element Is Visible    ${liferesults.header.premiumamount}    ${MEDIUM_WAIT}    Premium amount should be displayed in life policy page.
    ${premium_amount}=    Get Text    ${liferesults.header.premiumamount}
    ${select_rider}=    Update Dynamic Xpath    ${liferesults.page.riders}    ${select_riders}
    Click Element    ${select_rider}
    ${waiver_premium}=    Get Text    ${liferesults.header.premiumamount}
    Run Keyword If    ${waiver_premium}>${premium_amount}    ${SHORT_WAIT}    premium amount incresed
