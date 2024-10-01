*** Settings ***
Library    SeleniumLibrary
Library    XML

*** Variables ***

${Web_Katalon}            https://katalon-demo-cura.herokuapp.com/
${xpath_facility}         xpath=//option[@value='Hongkong CURA Healthcare Center']
${input_date}             id=txt_visit_date
${Comment}                xpath=//textarea[@id='txt_comment']
${btn_bookApointment}     xpath=//button[@id='btn-book-appointment']

${Web_OrangeHRM}          https://opensource-demo.orangehrmlive.com/web/index.php/auth/login

${Web_QavBox}             https://qavbox.github.io/demo/
${SignUpForm}             xpath=//a[normalize-space()='SignUp Form']


*** Test Cases ***
ScenarioTest_LoginWebKatalon
    Open Browser                ${Web_Katalon}                   chrome
    Sleep                       2s
    Click Element               id=btn-make-appointment
    Input Text                  name=username                    John Doe
    Input Text                  name=password                    ThisIsNotAPassword
    Click Element               id=btn-login
    Sleep                       2s
    Click Element               ${xpath_facility}
    Input Text                  ${input_date}                    25/09/2024
    Input Text                  ${Comment}                       SettingRobotFramework
    Click Element               ${btn_bookApointment}
    Sleep                       1s
    Capture Page Screenshot     D:/Pyhton/Robot/Screenshot/ApoinmentConfirmation.png
    Sleep                       3s
    Close Browser

ScenarioTest_LoginWebOrangeHRM
    Open Browser                ${Web_OrangeHRM}                   chrome
    Maximize Browser Window
    Sleep                       2s
    Input Text                  name=username                      Admin
    Input Text                  name=password                      admin123
    Click Element               xpath=//button[@type='submit']
    Sleep                       3s
    Capture Page Screenshot     D:/Pyhton/Robot/Screenshot/ProfilOrange.png
    Close Browser


ScenarioTest_SignUpForm
    Open Browser                ${Web_QavBox}                       chrome
    Click Element               ${SignUpForm}
    Maximize Browser Window
    Input Text                  xpath=//input[@id='username']       Robot Framework
    Input Text                  xpath=//input[@id='email']          robot@gmail.com
    Input Text                  xpath=//input[@id='tel']            +62812345678910
    Click Element               xpath=//select[@name='sgender']
    Click Element               xpath=//option[@value='male']
    Capture Page Screenshot     D:/Pyhton/Robot/Screenshot/Form.png
    Sleep                       3s
    Click Element               xpath=//input[@id='submit']
    Sleep                       3s
    Alert Should Be Present     Registration Done!
    Close Browser


