*** Variables ***
${liferesults.message}    //button[text()='OK, GOT IT!']
${liferesults.header.paymentfrequency}    //button[@id='paymentFrequency']
${liferesults.header.sumassured}    //button[@id='coverAmount']
${liferesults.header.premiumamount}    //span[contains(@data-auto,"policy-premium")]
${liferesults.page.data.ready}    //div[@class='pageLoader' and "isAsync && isResultLoading"]
${liferesults.page.riders}    //label[contains(text(),'replaceText') and contains(@class,'riderName')]/preceding-sibling::input
