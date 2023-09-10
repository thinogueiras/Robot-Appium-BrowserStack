*** Settings ***

Resource                    ../resources/base.resource

Test Setup                  Start Session
Test Teardown               Finish Session

*** Test Cases ***
Deve buscar pelo Chewbacca
    Navigate To             Star Wars

    Go To Item              Busca        Busque aqui

    Input Text              id=com.qaxperience.yodapp:id/etSearch        Chewbacca

    @{characters}           Create List        Mandaloriano    Darth Vader    Princesa Leia    Luke Skywalker

    FOR    ${character}    IN    @{characters}
        Wait Until Screen Does Not Contain        ${character}        
    END