***Keywords***
Modify Assets With Token    
    Create Session          ModifyAssets            ${url}
    ${token}=               Login To Get Token
    ${token_headers}=       Create Dictionary       token=${token}
    ${request_body}=        Create Dictionary       assetId=${asst_id}     assetName=${asst_name}      assetType=${asst_type}    inUse=${in_use}
    ${put_resp}=            PUT On Session          ModifyAssets   /assets          headers=${token_headers}     json=${request_body}     expected_status=200
    ${status}=              Set Variable            ${put_resp.json()['status']} 
    ${message}=             Set Variable            ${put_resp.json()['message']}
    Should Be Equal         ${put_resp.json()['status']}       success 
    Should Be Equal         ${put_resp.json()['message']}      remark: asset id will not be changed in any cases
    Log To Console          .
    Log To Console          Valid🟢
    Log To Console          HTTP code : ${put_resp} 
    Log To Console          HTTP code : ${request_body}
    Log to console          Status : ${status}
    Log to console          Message : ${message}
    RETURN                  ${request_body}