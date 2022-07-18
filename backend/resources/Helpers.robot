*Settings*
Documentation       Helpers

*Keywords*
Get Token
    [Arguments]     ${user}

    # obtendo o token
    ${payload}          Create Dictionary
    ...                 email=${user}[email]
    ...                 password=${user}[password]

    ${response}         POST Session    ${payload}
    ${result}           Set Variable    ${EMPTY}

    IF  "200" in "${response}"
        ${result}            Set Variable            Bearer ${response.json()}[token]
    END

    [return]        ${result}

Remove User
    [Arguments]     ${user}

    ${token}        Get Token       ${user}

    IF  "${token}"
        # Delete na rota users
        DELETE User         ${token}
    END