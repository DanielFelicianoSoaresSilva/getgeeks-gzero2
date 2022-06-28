*Settings*
Documentation       Test Helpers

*Keywords*
Add User From Database
    [Arguments]     ${user}

    Connect To Postgress
    Insert User  ${user}
    Disconnect From Database

# Add User
#     [Arguments]     ${user}

#     Go To Signup Form
#     Fill Signup Form    ${user}
#     Submit Signup Form
#     User Should Be Registered

Do Login
    [Arguments]     ${user}

    Go To Login Page
    Fill Credendials    ${user}
    Submit Credendials
    User Should Be Logged In  ${user}
    