*** Variables ***
${liferesults.message}    //button[text()='OK, GOT IT!']
${liferesults.header.paymentfrequency}    //button[@id='paymentFrequency']
${liferesults.header.sumassured}    //button[@id='coverAmount']
${liferesults.header.premiumamount}    //span[@class='bold anim-loader ng-binding']
${liferesults.page.data.ready}    //div[@class='pageLoader' and "isAsync && isResultLoading"]
${liferesults.page.riders}    //label[text()=' replaceText ']/preceding-sibling::input
