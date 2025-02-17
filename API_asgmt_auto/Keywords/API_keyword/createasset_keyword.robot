***Keywords***
Created New Assets With Token
    Create Session          CreateAssets            ${url}
    ${token}=               Login To Get Token
    ${token_headers}=       Create Dictionary       token=${token}
    ${random_number}=       Evaluate                random.randint(0,9)          modules=random
    ${request_body}=        Create Dictionary       assetId=${gen_create_new}${random_number}      assetName=${asst_name}   assetType=${asst_type}     inUse=${in_use}
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
    Create Session          CreateAssets            ${url}
    ${token}=               Login To Get Token
    ${token_headers}=       Create Dictionary       token=${token}
    ${request_body}=        Create Dictionary       assetId=${asst_id}     assetName=${asst_name}   assetType=${asst_type}     inUse=${in_use}
    ${post_resp}=           POST On Session         CreateAssets   /assets          headers=${token_headers}     json=${request_body}     expected_status=200
    ${status}=              Set Variable            ${post_resp.json()['status']} 
    ${message}=             Set Variable            ${post_resp.json()['message']}
    Should Be Equal         ${post_resp.json()['status']}    failed

    Log To Console          Invalid 🔴
    Log To Console          HTTP code : ${post_resp} 
    Log to console          Status : ${status}
    Log to console          Message : ${message}
