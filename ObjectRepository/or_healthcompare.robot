*** Variables ***
${healthcompare.pageheader}    //div[contains(@class,'commonPage compare-page')]
${healthcompare.coveramount}    (//span[@ng-if='prop.displayText' and contains(@data-auto,'coverAmount')])[replaceText]
${healthcompare.planname}    (//td[contains(@data-ng-repeat,'comparePlans')])[replaceText]//span[contains(@class,'planName')]
${healthcompare.button.premiumamount}    (//td[contains(@data-ng-repeat,'comparePlans')])[replaceText]//button[contains(@data-ng-click,'proceedToCheckout')]
