*** Settings ***
Library           SeleniumLibrary    #Test Teardown    Close Browser
Library           String

*** Variables ***
${baseurl}        https://uat.worldvision.in/landingPages/child/index-3.html
${browser}        chrome
${story_url}      https://uat.worldvision.in/
@{checkout_payment_list_text}    Powered by CC Avenue    Powered by AXIS BANK    POWERED BY HDFC BANK
@{SI_payment_list_text}    NET BANKING    Indian credit card    Debit card
@{checkout_payment_list_ind_passport}    Debit Card/Net banking/Wallets/Amex    Amazon Pay    International credit card    Indian credit cards    Offline Payment
${hygiene_kit}    400
${cash_covid19}    4500
${dry_ration}     1200
${general_donation_covid19}    1000
${for_little_txt}    For as little as 800 every month, you'll be doing much more than helping to meet your child's basic needs - you'll be helping to equip them for life. By bringing about lasting change in your sponsored child's community, you'll also be improving the lives of many other vulnerable children.
${LP_2_succcess_story_txt}    Every day World Vision India is touching the lives of thousands of children and their families. The stories featured here are unique and give us an insight into various circumstances in which children live and the opportunities that help them thrive and succeed in life.
${corporate_para1_txt}    World Vision India partners with Corporates to plan and execute sustainable, result-based CSR projects. Our customised, high-quality programmes help Corporates spend their CSR budgets responsibly in addressing some of the pressing needs of children, families and communities.
${corporate_para2_txt}    Our work with Indian and multi-national Corporations over the past two decades has helped us build long-standing relationships, bringing together the corporates and the communities around them. This has equipped us with the expertise to carry out large multi-sectoral projects across India, delivering quality work on quick timelines. Our objectives are aligned with the Sustainable Development Goals (SDGs) and the national priorities identified by India’s NITI Aayog in its Twelfth Five Year Plan (2012 – 2017). We journey with our partners over an exciting range of programmes from improving sanitation in schools to providing relief during emergencies to bridging gender gaps in communities. At World Vision India, we believe every Corporate engagement is a rewarding experience for both us and the Corporates we work with.

*** Test Cases ***
LP1 rows_2_4_5_7_8
    #2
    Local browser launch landingpage    https://uat.worldvision.in/landingPages/child/index.html    ${browser}
    Click Element    xpath=.//a[@class='btn btn-primary proceedtosi']
    ${alert_txt}=    Get Text    xpath=.//div[@class='swal-text']
    Run Keyword If    'Please select a child to sponsor'!='${alert_txt}'    Fail    "Without select child when click CTA button, alert text not display like 'Please select a child to sponsor' "
    Click Element    xpath=.//button[@class='swal-button swal-button--confirm']
    #4
    Click child in landingpage1
    ${chck_enable}=    Get Text    id=header_ChildCart_images
    Run Keyword If    '1    child selected'!='${chck_enable}'    Fail    "Child is selected but '1 child selected not display' "
    #5
    Scroll Element Into View    id=before-after-slider-img
    ${get_txt_}=    Get Text    xpath=.//p[@class='text-center']
    Run Keyword If    'When you sponsor a child, eight more children benefit.'!='${get_txt_}'    Fail    "'When you sponsor a child, eight more children benefit' text are mismatch"
    #8
    Scroll Element Into View    xpath=.//div[@class='cont-left-right-cont']
    ${get_txt_50_yrs}=    Get Text    xpath=.//div[@class='content-right']//div[@class='super-hero-block-list']/p[1]
    Log To Console    50+ yrs text:${get_txt_50_yrs}
    #7
    Scroll Element Into View    xpath=.//div[@class='img-bg sixth_image']
    ${get_assistance_amt}=    Get Text    xpath=.//div[@class='img-bg sixth_image']//h4
    Run Keyword If    '5,40,000'!='${get_assistance_amt}'    Fail    "Emergency assistance amount is differ"
    ${people_receive_txt}=    Get Text    xpath=.//div[@class='img-bg sixth_image']//p
    Run Keyword If    'people received emergency assistance'!='${people_receive_txt}'    Fail    "5,40,000 people received ect.. text are mismatch"

LP2 rows_10_12_13_14
    #10
    Local browser launch landingpage    https://uat.worldvision.in/landingPages/child/index-2.html    ${browser}
    Click Element    xpath=.//a[@class='btn btn-primary proceedtosi']
    ${alert_txt}=    Get Text    xpath=.//div[@class='swal-text']
    Run Keyword If    'Please select a child to sponsor'!='${alert_txt}'    Fail    "Without select child when click CTA button, alert text not display like 'Please select a child to sponsor' "
    Click Element    xpath=.//button[@class='swal-button swal-button--confirm']
    #12
    Click child in landingpage 2
    ${chck_enable}=    Get Text    xpath=.//*[@class='kid-add']/span
    Run Keyword If    '1 child selected'!='${chck_enable}'    Fail    "Child is selected but '1 child selected not display' "
    #13
    Scroll Element Into View    id=before-after-slider-img
    ${get_txt_}=    Get Text    xpath=.//p[@class='text-center']
    Run Keyword If    'When you sponsor a child, eight more children benefit.'!='${get_txt_}'    Fail    "'When you sponsor a child, eight more children benefit' text are mismatch"
    #15
    Scroll Element Into View    xpath=.//div[@class='cont-left-right-cont']
    ${get_txt_50_yrs}=    Get Text    xpath=.//div[@class='content-right']//div[@class='super-hero-block-list']/p[1]
    Log To Console    50+ yrs text:${get_txt_50_yrs}
    #14
    Scroll Element Into View    xpath=.//div[@class='img-bg sixth_image']
    ${get_assistance_amt}=    Get Text    xpath=.//div[@class='img-bg sixth_image']//h4
    Run Keyword If    '5,40,000'!='${get_assistance_amt}'    Fail    "Emergency assistance amount is differ"
    ${people_receive_txt}=    Get Text    xpath=.//div[@class='img-bg sixth_image']//p
    Run Keyword If    'people received emergency assistance'!='${people_receive_txt}'    Fail    "5,40,000 people received ect.. text are mismatch"
    #43

LP3 rows_21_22_24_29_31_32_33_34_35_36_30
    #23
    Local browser launch landingpage    https://uat.worldvision.in/landingPages/child/index-3.html    ${browser}
    Click Element    xpath=.//div[@class='donatenowbtn']/a[1]
    ${chck_alert_display}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@class='swal-modal']
    Run Keyword If    True!=${chck_alert_display}    Fail    "Click 'Donate Now' button without select amount, alert are not display"
    Click Element    xpath=.//div[@class='donatenowbtn']/a[1]
    ${chck_alert_disable}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@class='swal-modal']
    Run Keyword If    False!=${chck_alert_disable}    Fail    "We are able to scroll down even without closing the 'Select Amount to Proceed' Alert"
    #21_22
    ${getfor_title_para}=    Get Text    xpath=.//div[@class='formright']//p[1]
    Run Keyword If    '${getfor_title_para}'!='${for_little_txt}'    Fail    "For as title etc.. display text are differ"
    #24
    Scroll Element Into View    xpath=.//h3[@class='titles2']
    ${get_success_story_txt}=    Get Text    xpath=.//div[@class='banner-titles']/p
    Run Keyword If    '${LP_2_succcess_story_txt}'!='${get_success_story_txt}'    Fail    "Success stories para text are mismatch"
    #25
    ${get_count_readmore_btn}=    Get Element Count    xpath=.//div[@class='row partnermodals mobilerow']/div/div/div//p[@class='leftlink']/a
    FOR    ${index}    IN    RANGE    ${get_count_readmore_btn}
        ${get_readmore_url}=    Get Element Attribute    xpath=(.//div[@class='row partnermodals mobilerow']/div/div/div//p[@class='leftlink']/a)[${index}]    href
        ${get_url}=    Evaluate    ${story_url}+ChildSponsorship/stories-of-change
        Run Keyword If    ${get_url}!=${get_readmore_url}    Fail    "Readmore button link not redirect to stories of change"
    END
    #29
    Scroll Element Into View    xpath=.//div[@class='subspartner subparttwo']/div
    ${get_txt_partnership}=    Get Text    xpath=.//div[@class='subspartner subparttwo']/div//h2
    Run Keyword If    'Corporate Partnership'!='${get_txt_partnership}'    Fail    "Corporate Partnership text are mismatch"
    #31
    Scroll Element Into View    xpath=.//div[@class='whitebtns']/input
    Click Element    xpath=.//div[@class='whitebtns']/input
    ${get_org_alert_txt}=    Get Text    id=signUpornameErr
    Run Keyword If    'Please enter your organisation's name'!='${get_org_alert_txt}'    Fail    "Please enter your organisation,s name alert text are mismatch"
    Input Text    id=organname forminput    dsas
    #32
    Click Element    xpath=.//div[@class='whitebtns']/input
    ${get_contact_alert_txt}=    Get Text    id=signUppernameErr
    Run Keyword If    'Please enter your name'!='${get_contact_alert_txt}'    Fail    "Please enter your name alert text are mismatch"
    Input Text    id=conperson forminput    logi
    #33
    Click Element    xpath=.//div[@class='whitebtns']/input
    ${get_contact_no_alert_txt}=    Get Text    id=signInpernumberErr
    Run Keyword If    'Please enter a valid mobile number'!='${get_contact_no_alert_txt}'    Fail    "Please enter valid mob no alert text are mismatch"
    Input Text    id=connumber forminput    9867654543
    #34
    Click Element    xpath=.//div[@class='whitebtns']/input
    ${get_email_alert_txt}=    Get Text    id=signUpperemailErr
    Run Keyword If    'Please enter a valid e-mail id'!='${get_email_alert_txt}'    Fail    "Please enter valid email id alert text are mismatch"
    Input Text    id=conemail forminput    logi@gmail.com
    #35
    Click Element    xpath=.//div[@class='whitebtns']/input
    ${get_leave_msg_alert_txt}=    Get Text    id=signUppermsgErr
    Run Keyword If    'Please leave a message'!='${get_leave_msg_alert_txt}'    Fail    "Please leave a message alert text are mismatch"
    Input Text    id=conmsg forminput    test
    #36
    Click Element    xpath=.//div[@class='whitebtns']/input
    ${get_thankq_alert_msg}=    Get Text    xpath=.//div[@class='swal-text']
    Run Keyword If    'Thank you for getting in touch with us. We will get back to you shortly.'!='${get_thankq_alert_msg}'    Fail    "Thank you for geeting etc., alert text are differ"
    Click Element    xpath=.//button[@class='swal-button swal-button--confirm']
    #30
    Scroll Element Into View    xpath=.//div[@class='subspartner subparttwo']/div
    ${get_corporate_para1}=    Get Text    xpath=.//div[@class='col-md-6 textleft']/p[1]
    Run Keyword If    '${corporate_para1_txt}'!='${get_corporate_para1}'    Fail    "Corporate Partnership para1 text are mismatch"
    ${get_corporate_para2}=    Get Text    xpath=.//div[@class='col-md-6 textleft']/p[3]
    Run Keyword If    '${corporate_para2_txt}'!='${get_corporate_para2}'    Fail    "Corporate Partnership para2 text are mismatch"

LPs rows_44
    #Jenkins browser launch    https://uat.worldvision.in/landingPages/child/index.html
    Local browser launch landingpage    https://uat.worldvision.in/landingPages/child/index.html    ${browser}
    Select child in landingpage
    Landing singin
    #Jenkins browser launch    https://uat.worldvision.in/landingPages/child/index-2.html
    Local browser launch landingpage    https://uat.worldvision.in/landingPages/child/index-2.html    ${browser}
    Select child in landingpage 2
    Landing2 singin

SI Payment success page > unable to scroll the footer
    #Jenkins browser launch    https://uat.worldvision.in/landingPages/child/index-3.html
    Local browser launch landingpage    https://uat.worldvision.in/landingPages/child/index-3.html    ${browser}
    ${get_sel_child_val}=    Select child in landingpage 3
    ${total_val}=    Get Text    xpath=.//span[@id='total']/b
    Run Keyword If    '₹${total_val}'!='${get_sel_child_val}'    Fail    "Total display amount and selected child amount are not equal"
    Click Element    xpath=.//label[@for='allowAutoDebit']
    ${chck_covid_section_clickable}=    Run Keyword And Return Status    Click Element    id=cash2
    Run Keyword If    True==${chck_covid_section_clickable}    Fail    "When select child try to make payment using SI flow but Covid section is in enable mode"
    Click Element    xpath=.//div[@class='donatenowbtn']/a[contains(.,'PROCEED TO AUTO DEBIT')]
    Capture Page Screenshot
    Landing singin
    Payment gateway list size and text for SI flow

Drupal Success page - order Details not listing
    #Jenkins browser launch    https://uat.worldvision.in/landingPages/child/index-3.html
    Local browser launch landingpage    https://uat.worldvision.in/landingPages/child/index-3.html    ${browser}
    ${chck_covid_sec_display}=    Run Keyword And Return Status    Element Should Be Visible    id=covid
    Run Keyword If    'True'!='${chck_covid_sec_display}'    Fail    "Landing page3 Covid section not display"
    Select From List By Value    id=cash2    ${hygiene_kit}
    ${get_hugiene_val}=    Get Text    xpath=
    Select From List By Value    id=cash3    ${cash_covid19}
    Select From List By Value    id=cash4    ${dry_ration}
    Input Text    id=email1    ${general_donation_covid19}
    ${get_total_val_dropdown}=    Evaluate    ${cash_covid19}+${dry_ration}+${hygiene_kit}+${general_donation_covid19}
    ${total_display_val}=    Get Text    xpath=.//span[@id='total']/b
    ${remove_comma_symbol}=    Remove symbol    ${total_display_val}    ,
    Run Keyword If    ${get_total_val_dropdown}!=${remove_comma_symbol}    Fail    "Drop down total value and overall total amount is differ"
    Click Element    xpath=.//span[@class='slider round']
    ${chck_child_diable}=    Get Element Attribute    id=childimg    class
    Run Keyword If    'childimagedis'!='${chck_child_diable}'    Fail    "Child section not disable when click 'Add Child Sponsorship'
    Click Element    xpath=.//div[@class='donatenowbtn']/a[contains(.,'DONATE NOW')]
    Landing3 singin
    Payment gateway list size and text for indian passport holder
    CCavenue payment success flow
    #${get_row_count}=    Get Element Count    xpath=.//table//tr
    #FOR    IN RANGE    1    ${get_row_count}
    #END

After Transaction is failed/cancelled, the page is asking for login again
    #Jenkins browser launch    https://uat.worldvision.in/landingPages/child/index-3.html
    Local browser launch landingpage    https://uat.worldvision.in/landingPages/child/index-3.html    ${browser}
    ${chck_covid_sec_display}=    Run Keyword And Return Status    Element Should Be Visible    id=covid
    Run Keyword If    'True'!='${chck_covid_sec_display}'    Fail    "Landing page3 Covid section not display"
    Select From List By Value    id=cash2    ${hygiene_kit}
    Select From List By Value    id=cash3    ${cash_covid19}
    Select From List By Value    id=cash4    ${dry_ration}
    Input Text    id=email1    ${general_donation_covid19}
    ${get_total_val_dropdown}=    Evaluate    ${cash_covid19}+${dry_ration}+${hygiene_kit}+${general_donation_covid19}
    ${total_display_val}=    Get Text    xpath=.//span[@id='total']/b
    ${remove_comma_symbol}=    Remove symbol    ${total_display_val}    ,
    Run Keyword If    ${get_total_val_dropdown}!=${remove_comma_symbol}    Fail    "Drop down total value and overall total amount is differ"
    Click Element    xpath=.//span[@class='slider round']
    ${chck_child_diable}=    Get Element Attribute    id=childimg    class
    Run Keyword If    'childimagedis'!='${chck_child_diable}'    Fail    "Child section not disable when click 'Add Child Sponsorship'
    Click Element    xpath=.//div[@class='donatenowbtn']/a[contains(.,'DONATE NOW')]
    Landing3 singin
    Payment gateway list size and text for indian passport holder
    CCAvenue payment failure flow
    Click Element    xpath=.//div[@class='payfailbtn']/a
    ${check_back_to_landingpage}=    Run Keyword And Return Status    Element Should Be Visible    id=covid
    Run Keyword If    True!=${check_back_to_landingpage}    Fail    "In payment failure when click 'Try Again' button it will not redirect to the landingpage 3"

*** Keywords ***
Jenkins browser launch
    [Arguments]    ${url}
    Set Selenium Speed    1s
    ${chrome_options} =    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    headless
    Call Method    ${chrome_options}    add_argument    disable-gpu
    Call Method    ${chrome_options}    add_argument    no-sandbox
    Create WebDriver    Chrome    chrome_options=${chrome_options}
    Set Window Size    1920    1080
    Go To    ${url}
    #Maximize Browser Window
    Set Browser Implicit Wait    60s

Local browser launch landingpage
    [Arguments]    ${baseurl}    ${browser}
    Set Selenium Speed    .5s
    Open Browser    ${baseurl}    ${browser}
    Maximize Browser Window
    Set Browser Implicit Wait    50s

CCavenue payment success flow
    #Wait Until Element Is Visible    xpath=.//div[@id='block-paymentmode']//div[@id='edit-payment-information-payment-method']/div/span[contains(.,'Powered by AXIS BANK')]
    #Click Element    xpath=.//div[@id='block-paymentmode']//div[@id='edit-payment-information-payment-method']/div/span[contains(.,'Powered by AXIS BANK')]/preceding-sibling::input
    #Click Element    xpath=.//div[@id='block-paymentmode']//div[@id='edit-payment-information-payment-method']/div/span[contains(.,'Powered by CC Avenue')]/preceding-sibling::input
    #Sleep    4s
    ${chck_ccaveneu_click}=    Get Element Attribute    xpath=.//div[@id='block-paymentmode']//div[@id='edit-payment-information-payment-method']/div/span[contains(.,'Powered by CC Avenue')]/parent::div    class
    Run Keyword If    '${chck_ccaveneu_click}'!='js-form-item form-item js-form-type-radio form-item-payment-information-payment-method js-form-item-payment-information-payment-method active'    Click Element    xpath=.//div[@id='block-paymentmode']//div[@id='edit-payment-information-payment-method']/div/span[contains(.,'Powered by CC Avenue')]/parent::div
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//div[@id='edit-actions']/input
    #${order_id}=    Get Text    xpath=.//span[@class='order-value']
    #Log To Console    Order id:${order_id}
    Click Element    xpath=(.//div[@id='OPTNBK']//span[2][contains(text(),'Net Banking')])[1]
    Select From List By Value    id=netBankingBank    AvenuesTest
    Click Element    xpath=(.//span[starts-with(text(),'Make')])[3]
    Click Element    xpath=.//input[@type='submit']
    ${payment_success_msg}=    Get Text    xpath=.//div[@class='payment-success-message']/h3
    Run Keyword If    'PAYMENT SUCCESSFULL'!='${payment_success_msg}'    Fail    "Payment successful page not display"

CCAvenue payment failure flow
    ${chck_ccaveneu_click}=    Get Element Attribute    xpath=.//div[@id='block-paymentmode']//div[@id='edit-payment-information-payment-method']/div/span[contains(.,'Powered by CC Avenue')]/parent::div    class
    Run Keyword If    '${chck_ccaveneu_click}'!='js-form-item form-item js-form-type-radio form-item-payment-information-payment-method js-form-item-payment-information-payment-method active'    Click Element    xpath=.//div[@id='block-paymentmode']//div[@id='edit-payment-information-payment-method']/div/span[contains(.,'Powered by CC Avenue')]/parent::div
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=.//div[@id='edit-actions']/input
    #${order_id}=    Get Text    xpath=.//span[@class='order-value']
    #Log To Console    Order id:${order_id}
    Click Element    xpath=(.//div[@id='OPTNBK']//span[2][contains(text(),'Net Banking')])[1]
    Select From List By Value    id=netBankingBank    AvenuesTest
    Click Element    xpath=(.//span[starts-with(text(),'Make')])[3]
    Select From List By Value    xpath=.//select[@name='PAID']    N
    Click Element    xpath=.//input[@type='submit']
    ${payment_success_msg}=    Get Text    xpath=.//div[@class='content block-content']/div/h3/span
    Log To Console    Payment failure text:${payment_success_msg}
    Run Keyword If    'PAYMENT FAILED'!='${payment_success_msg}'    Fail    "Payment Failure page not display"

Click child in landingpage1
    Scroll Element Into View    xpath=.//div[@class='donatenow supportchildActive']
    Click Element    xpath=(.//div[@class='owl-item active'])[2]

Select child in landingpage
    Scroll Element Into View    xpath=.//div[@class='donatenow supportchildActive']
    Click Element    xpath=(.//div[@class='owl-item active'])[2]
    Click Element    xpath=(.//div[@id='mqhy']/div)[2]
    ${get_child_name}=    Get Text    xpath=(.//div[@class='owl-item active'])[2]//label/div[@class='sliderNameTag']/b
    ${get_child_img_chsrc}=    Get Element Attribute    xpath=(.//div[@class='owl-item active'])[2]//label/img    src
    ${get_val}=    Get Element Attribute    xpath=(.//div[@id='mqhy']/div)[2]/input    value
    Log To Console    Child name:${get_child_name}
    Log To Console    Child img src:${get_child_img_chsrc}
    Log To Console    Child amount:${get_val}
    Click Element    xpath=.//label[@for='allowAutoDebit']
    Click Element    xpath=.//div[@class='donatenowbtn text-right']/a[contains(.,'SPONSOR NOW')]

Select child in landingpage1 using SI flow
    Scroll Element Into View    xpath=.//div[@class='donatenow supportchildActive']
    Click Element    xpath=(.//div[@class='owl-item active'])[2]
    Click Element    xpath=(.//div[@id='mqhy']/div)[2]
    ${get_child_name}=    Get Text    xpath=(.//div[@class='owl-item active'])[2]//label/div[@class='sliderNameTag']/b
    ${get_child_img_chsrc}=    Get Element Attribute    xpath=(.//div[@class='owl-item active'])[2]//label/img    src
    ${get_val}=    Get Element Attribute    xpath=(.//div[@id='mqhy']/div)[2]/input    value
    Log To Console    Child name:${get_child_name}
    Log To Console    Child img src:${get_child_img_chsrc}
    Log To Console    Child amount:${get_val}
    Click Element    xpath=.//div[@class='donatenowbtn text-right']/a[contains(.,'PROCEED TO AUTO DEBIT')]

Click child in landingpage 2
    Scroll Element Into View    xpath=.//div[@class='owl-stage']
    Click Element    xpath=(.//div[@class='owl-item active']//div[@class='pic'])[1]

Select child in landingpage 2
    Scroll Element Into View    xpath=.//div[@class='owl-stage']
    Click Element    xpath=(.//div[@class='owl-item active']//div[@class='pic'])[1]
    ${get_child_img_src}=    Get Element Attribute    xpath=(.//div[@class='owl-item active']//div[@class='pic']/img)[1]    src
    ${get_child_name}=    Get Text    xpath=(.//div[@class='owl-item active']//div[@class='select-kid-dec']/p/strong)[1]
    ${get_def_val}=    Get Element Attribute    xpath=.//span[@class='irs-grid-text js-grid-text-0']/span    value
    Log To Console    Selected Child name in landing page 2:${get_child_name}
    Log To Console    Selected Child img src in landing page 2:${get_child_img_src}
    Log To Console    Selected Child default amount in landing page 2:${get_def_val}
    ${get_input_val}=    Get Element Attribute    xpath=.//input[@name='directPayment']    value
    Run Keyword If    '${get_def_val}'!='${get_input_val}'    Fail    "Default '800' amount and input displayed amount are different"
    Click Element    xpath=.//label[@for='allowAutoDebit']
    Click Element    xpath=.//div[@class='col-sm-4 textRight pn']//a[contains(.,'SPONSOR NOW')]

Select child in landingpage2 using SI flow
    Scroll Element Into View    xpath=.//div[@class='owl-stage']
    Click Element    xpath=(.//div[@class='owl-item active']//div[@class='pic'])[2]
    ${get_child_img_src}=    Get Element Attribute    xpath=(.//div[@class='owl-item active']//div[@class='pic']/img)[2]    src
    ${get_child_name}=    Get Text    xpath=(.//div[@class='owl-item active']//div[@class='select-kid-dec']/p/strong)[2]
    ${get_def_val}=    Get Element Attribute    xpath=.//span[@class='irs-grid-text js-grid-text-0']/span    value
    Log To Console    Selected Child name in landing page using SI flow:${get_child_name}
    Log To Console    Selected Child img src in landing page using SI flow:${get_child_img_src}
    Log To Console    Selected Child default amount in landing page using SI flow:${get_def_val}
    ${get_input_val}=    Get Element Attribute    xpath=.//input[@name='directPayment']    value
    Run Keyword If    '${get_def_val}'!='${get_input_val}'    Fail    "Default '800' amount and input displayed amount are different"
    Click Element    xpath=.//div[@class='col-sm-4 textRight pn']//a[contains(.,'PROCEED TO AUTO DEBIT')]

Onetime donation
    Click Element    xpath=.//span[@class='toggle-handle btn btn-default btn-xs']
    Input Text    xpath=.//input[@name='directPayment']    1000
    Click Element    xpath=.//div[@class='col-sm-4 textRight pn']//a[contains(.,'DONATE NOW')]

Select multi child in landingpage2 using checkout page
    Scroll Element Into View    xpath=.//div[@class='owl-stage']
    Click Element    xpath=(.//div[@class='owl-item active']//div[@class='pic'])[1]
    Click Element    xpath=(.//div[@class='owl-item active']//div[@class='pic'])[2]
    Click Element    xpath=(.//div[@class='owl-item active']//div[@class='pic'])[3]
    ${get_def_val}=    Get Element Attribute    xpath=.//span[@class='irs-grid-text js-grid-text-0']/span    value
    ${get_input_val}=    Get Element Attribute    xpath=.//input[@name='directPayment']    value
    ${get_total_val_}=    Evaluate    ${get_def_val}*3
    Log To Console    3 child totoal amt is:${get_total_val_}
    Run Keyword If    ${get_input_val}!=${get_total_val_}    Fail    "Select 3 child total amount is differ"

Select child in landingpage 3
    Click Element    xpath=(.//div[@class='owl-item active']//div[@class='stepwizard-step']//label)[2]
    ${get_child_img_src}=    Get Element Attribute    xpath=.//div[@class='owl-item active']//img    src
    ${get_child_name}=    Get Text    xpath=.//div[@class='owl-item active']//div[@class='sliderNameTag']/h4
    ${get_val}=    Get Text    xpath=(.//div[@class='owl-item active']//div[@class='stepwizard-step']/p/span[1])[2]
    Log To Console    Selected Child name in landing page 3:${get_child_name}
    Log To Console    Selected Child img src in landing page 3:${get_child_img_src}
    Log To Console    Selected Child amount in landing page 3:${get_val}
    [Return]    ${get_val}

Landing singin
    ${display_reg}=    Run Keyword And Return Status    Element Should Be Visible    id=accordion
    Run Keyword If    True!=${display_reg}    Fail    "Regsitration section not display"
    Click Element    xpath=.//a[@class='show-signin']
    Input Text    id=email    kumaran@xerago.com
    Input Text    id=pwd    test
    Click Element    xpath=.//a[@class='btn btn-default wvSignIn']

Landing2 singin
    ${display_reg}=    Run Keyword And Return Status    Element Should Be Visible    id=accordion
    Run Keyword If    True!=${display_reg}    Fail    "Regsitration section not display"
    Click Element    xpath=.//a[@class='show-signin']
    Input Text    id=email    kumaran@xerago.com
    Input Text    id=pwd    test
    Click Element    xpath=.//a[@class='btn btn-default wvSignIn']

Landing3 singin
    ${display_reg}=    Run Keyword And Return Status    Element Should Be Visible    id=accordion
    Run Keyword If    True!=${display_reg}    Fail    "Regsitration section not display"
    Click Element    xpath=.//a[@class='show-signin']
    Input Text    id=emailcheck    kumaran@xerago.com
    Input Text    id=pwd    test
    Click Element    xpath=.//a[@class='btn btn-default wvSignIn']

Payment gateway list size and text for SI flow
    Sleep    5s
    Capture Page Screenshot
    ${SI_payment_list}=    Get Element Count    xpath=.//div[@class='payment-main-content']/div
    Run Keyword If    3!=${SI_payment_list}    Fail    "SI Flow payment gateway list mismatch"
    FOR    ${SI_payment_txt}    IN    @{SI_payment_list_text}
        ${SI_payment_txt_chck}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@class='payment-main-content']/div[contains(.,'${SI_payment_txt}')]
        Run Keyword If    'True'!='${SI_payment_txt_chck}'    Fail    "SI flow payment gateway ${SI_payment_txt} text are mismatch"
    END

Payment gateway list size and text for indian passport holder
    Sleep    5s
    Capture Page Screenshot
    ${checkout_payment_list}=    Get Element Count    xpath=.//div[@id='block-paymentmode']//div[@id='edit-payment-information-payment-method']/div
    Run Keyword If    5!=${checkout_payment_list}    Fail    "Checkout flow Indian passport holder payment list are mismatch"
    FOR    ${bank_txt}    IN    @{checkout_payment_list_text}
        ${checkout_banklist_name_check}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@id='block-paymentmode']//div[@id='edit-payment-information-payment-method']/div/span[contains(.,'${bank_txt}')]
        Run Keyword If    'True'!='${checkout_banklist_name_check}'    Fail    'Checkout Flow Indian passport holder Payment Gateway Powered by ${bank_txt} text is mismatch'
    END
    FOR    ${checkout_bank_txt}    IN    @{checkout_payment_list_ind_passport}
        ${checkout_banklist_name_check}=    Run Keyword And Return Status    Element Should Be Visible    xpath=.//div[@id='block-paymentmode']//div[@id='edit-payment-information-payment-method']/div/label[contains(.,'${checkout_bank_txt}')]
        Run Keyword If    'True'!='${checkout_banklist_name_check}'    Fail    'Checkout Flow Indian passport holder Payment Gateway ${bank_txt} text is mismatch'
    END

check default amt and child in page1
    Scroll Element Into View    xpath=.//div[@class='donatenow supportchildActive']
    ${chck_default_amt_sel}=    Get Element Attribute    xpath=(.//div[@id='mqhy']/div/input)[1]    checked
    Run Keyword If    'true'!='${chck_default_amt_sel}'    Fail    "By default '800' amount not in selected mode"
    ${get_child_count}=    Get Element Count    xpath=.//div[@class='selectchildslider owl-carousel owl-theme owl-loaded owl-drag']//div[@class='owl-stage']/div[@class='owl-item active']
    Run Keyword If    ${get_child_count}<1    Fail    "Child not display in slider section"
    ${chck_bf_allow_btn}=    Execute Javascript    return window.jQuery('#allowAutoDebit').prop('checked')
    Run Keyword If    'True'!='${chck_bf_allow_btn}'    Fail    "By default 'Allow auto debit' button not clicked"
    ${procced_btn_txt}=    Get Text    xpath=(.//div[@class='donatenowbtn text-right']/a)[2]
    Run Keyword If    'PROCEED TO AUTO DEBIT'!='${procced_btn_txt}'    Fail    "When 'Auto auto debit' is checked 'Proceed to auto debit' text is not display"
    Click Element    xpath=.//label[@for='allowAutoDebit']
    ${chck_af_alllow_btn}=    Execute Javascript    return window.jQuery('#allowAutoDebit').prop('checked')
    Run Keyword If    'False'!='${chck_af_alllow_btn}'    Fail    "After clicked 'Allow auto debit', button not change into uncheck"
    ${sponsor_btn_txt}=    Get Text    xpath=(.//div[@class='donatenowbtn text-right']/a)[1]
    Run Keyword If    'SPONSOR NOW'!='${sponsor_btn_txt}'    Fail    "When 'Auto auto debit' is unchecked 'Sponsor Now' text is not display"

check default amt and child in page2
    Scroll Element Into View    xpath=.//div[@class='owl-stage']
    ${get_child_count}=    Get Element Count    xpath=.//div[@class='owl-stage']/div[@class='owl-item active' and @class='owl-item']
    Log To Console    Child count is:${get_child_count}
    Run Keyword If    ${get_child_count}<1    Fail    "Child not display in slider section"
    ${chck_bf_allow_btn}=    Execute Javascript    return window.jQuery('#allowAutoDebit').prop('checked')
    Run Keyword If    'True'!='${chck_bf_allow_btn}'    Fail    "By default 'Allow auto debit' button not clicked"
    ${procced_btn_txt}=    Get Text    xpath=(.//div[@class='col-sm-4 textRight pn']/a)[2]
    Run Keyword If    'PROCEED TO AUTO DEBIT'!='${procced_btn_txt}'    Fail    "When 'Auto auto debit' is checked 'Proceed to auto debit' text is not display"
    Click Element    xpath=.//label[@for='allowAutoDebit']
    ${chck_af_alllow_btn}=    Execute Javascript    return window.jQuery('#allowAutoDebit').prop('checked')
    Run Keyword If    'False'!='${chck_af_alllow_btn}'    Fail    "After clicked 'Allow auto debit', button not change into uncheck"
    ${sponsor_btn_txt}=    Get Text    xpath=(.//div[@class='col-sm-4 textRight pn']/a)[1]
    Run Keyword If    'SPONSOR NOW'!='${sponsor_btn_txt}'    Fail    "When 'Auto auto debit' is unchecked 'Sponsor Now' text is not display"

Remove symbol
    [Arguments]    ${val}    ${sysmbol}
    ${output}=    Remove String    ${val}    ${sysmbol}
    [Return]    ${output}
