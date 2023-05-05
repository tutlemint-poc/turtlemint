*** Settings ***
Resource          ../Global/super.robot

*** Variables ***
${radiobuttons.male}    //div[text()='Male ']
${radiobuttons.health}    //label[@class='select-type-health-desk']
${radiobuttons.no}    //span[contains(text(),'No')]
${radiobuttons.gender}    //div[text()='replaceText ']
${radiobuttons.amount}    //span[contains(text(),'More than Rs 10 lakhs')]
