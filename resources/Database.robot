*Settings*
Documentation       Database Helpers

Library     DatabaseLibrary
Library     factories/Users.py

*Keywords*
Connect To Postgress

    Connect To Database     psycopg2
    ...                     ovlhmnzq
    ...                     ovlhmnzq
    ...                     q0UlXaivmnJg2jmqkyWT0fg1T6T958eQ
    ...                     drona.db.elephantsql.com
    ...                     5432

Reset Env

    Execute SQL String      DELETE from public.geeks;
    Execute SQL String      DELETE from public.users;

Insert User
    [Arguments]         ${u}

    ${hashed_pass}      Get Hashed Pass     ${u}[password]

    ${q}    Set Variable    INSERT into public.users (name, email, password_hash, is_geek) values ('${u}[name] ${u}[lastname]', '${u}[email]', '${hashed_pass}', false)

    Execute SQL String      ${q}

Users Seed

    ${user}     Factory User    login
    Insert User     ${user}

    ${user2}     Factory user   be_geek
    Insert User     ${user2}

    ${user3}     Factory user   attempt_be_geek
    Insert User     ${user3}
    