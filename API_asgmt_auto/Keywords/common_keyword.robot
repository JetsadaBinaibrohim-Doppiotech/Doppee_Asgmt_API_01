***Keywords***
Login To Get Token
    Create Session          LoginForToken       ${url}
    ${request_body}=        Create Dictionary   username=${user_name}  password=${pass_word}
    ${response}=            POST On Session     LoginForToken   /login  json=${request_body}    expected_status=200
    ${token}=               Set Variable        ${response.json()['message']}
    RETURN                  ${token}



    
    