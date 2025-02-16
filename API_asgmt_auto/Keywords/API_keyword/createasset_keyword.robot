***Keywords***
Created New Assets With Token
    Create Session          CreateAssets            http://localhost:8082
    ${token}=               Login To Get Token
    ${token_headers}=       Create Dictionary       token=${token}
    ${random_number}=       Evaluate                random.randint(10,100)          modules=random
    ${request_body}=        Create Dictionary       assetId=ar${random_number}      assetName=Smart Robot       assetType=9     inUse=true
    ${post_resp}=           POST On Session         CreateAssets   /assets          headers=${token_headers}     json=${request_body}     expected_status=200
    ${status}=              Set Variable            ${post_resp.json()['status']} 
    ${message}=             Set Variable            ${post_resp.json()['message']}
    Should Be Equal         ${post_resp.json()['status']}    success
    Log To Console          .
    Log To Console          Valid 🟢
    Log To Console          HTTP code : ${post_resp} 
    Log to console          Status : ${status}
    Log to console          Message : ${message} ""
    RETURN                  ${request_body}

Created New Assets With Duplicated ID 
    Create Session          CreateAssets            http://localhost:8082
    ${token}=               Login To Get Token
    ${token_headers}=       Create Dictionary       token=${token}
    ${request_body}=        Create Dictionary       assetId=a001     assetName=Macbook Pro      assetType=1    inUse=true
    ${post_resp}=           POST On Session         CreateAssets   /assets          headers=${token_headers}     json=${request_body}     expected_status=200
    ${status}=              Set Variable            ${post_resp.json()['status']} 
    ${message}=             Set Variable            ${post_resp.json()['message']}
    Should Be Equal         ${post_resp.json()['status']}    failed

    Log To Console          Invalid 🔴
    Log To Console          HTTP code : ${post_resp} 
    Log to console          Status : ${status}
    Log to console          Message : ${message}
