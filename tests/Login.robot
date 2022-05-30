*Settings*
Documentation       Login Test Suite

Resource        ${EXECDIR}/resources/Base.robot

Test Setup      Start Session
Test Teardown   Finish Session

*Test Cases*
User Login

    ${user}                 Factory User Login

    Go To Login Page
    Fill Credendials        ${user}
    Submit Credendials
    User Should Be Logged In    ${user}

Incorrect Pass
    [Tags]      i_pass

    ${user}     Create Dictionary       email=daniel@hotmail.com        password=abc123

    Go To Login Page
    Fill Credendials  ${user}
    Submit Credendials
    Modal Content Should Be  Usuário e/ou senha inválidos.

User Not Found
    [Tags]      user_404

    ${user}     Create Dictionary       email=daniel@404.net        password=pwd123

    Go To Login Page
    Fill Credendials  ${user}
    Submit Credendials
    Modal Content Should Be  Usuário e/ou senha inválidos.

Incorrect Email
    [Tags]      i_email

    ${user}     Create Dictionary       email=daniel.com.br        password=pwd123

    Go To Login Page
    Fill Credendials  ${user}
    Submit Credendials
    Shoud Be Type Email
