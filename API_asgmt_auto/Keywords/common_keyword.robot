***Keywords***
Login To Get Token
    Create Session          LoginForToken       http://localhost:8082
    ${request_body}=        Create Dictionary   username=doppio  password=weBuildBestQa
    ${response}=            POST On Session     LoginForToken   /login  json=${request_body}    expected_status=200
    ${token}=               Set Variable        ${response.json()['message']}
    RETURN                  ${token}



    
    