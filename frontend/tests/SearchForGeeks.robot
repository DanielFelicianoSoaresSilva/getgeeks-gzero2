*Settings*
Documentation       Search for geeks test suite

Resource        ${EXECDIR}/resources/Base.robot

Test Setup      Start Session
Test Teardown   After Test

*Test Cases*
Search for Alien Geek

    ${alien}    Factory User        search_alien
    Create Geek Profile Service     ${alien}

    ${searcher}     Factory User    searcher
    Do Login        ${searcher}

    Go To Geeks
    Fill Search Form        Sim     Matricial a fita colorida
    Submit Search Form
    Geek Should Be Found    ${alien}
    Alien Icon Should Be visible

Search for Common Geek

    ${common}    Factory User        search_common
    Create Geek Profile Service     ${common}

    ${searcher}     Factory User    searcher
    Do Login        ${searcher}

    Go To Geeks
    Fill Search Form        Não     PC x86 ou x64
    Submit Search Form
    Geek Should Be Found    ${common}

Search Not Found

    ${searcher}     Factory User    searcher
    Do Login        ${searcher}

    Go To Geeks
    Fill Search Form        Não     Games
    Submit Search Form
    Geek Not Found
    