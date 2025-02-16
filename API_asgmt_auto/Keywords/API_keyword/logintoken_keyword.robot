***Keywords***
Login With Invalid Data
    Create Session      loginSession                http://localhost:8082
    ${request_body}=    Create Dictionary           username=Invaliduser  password=Invalidpass
    ${post_resp}=       POST On Session             loginSession    /login      json=${request_body}    expected_status=401
    ${status}=          Set Variable                ${post_resp.json()['status']} 
    ${message}=         Set Variable                ${post_resp.json()['message']}
    Should Be Equal     ${post_resp.json()['status']}    error
    Should Be Equal     ${post_resp.json()['message']}   invalid username or password
    Log To Console          .
    Log To Console      Invalid 🔴
    Log To Console      HTTP code : ${post_resp} 
    Log to console      Status : ${status}
    Log to console      Message : ${message}

Login With Valid Data
    Create Session          loginSession                http://localhost:8082
    ${token}=               Login To Get Token
    Should Be Equal         ${response.json()['status']}    success
    Should Be Equal         ${response.json()['message']}   ${token}
    Log To Console          .
    Log To Console          Valid 🟢
    Log To Console          HTTP code : ${response} 
    Log To Console          Token : ${token}
    Set Global Variable     ${token}
    RETURN                  ${token}