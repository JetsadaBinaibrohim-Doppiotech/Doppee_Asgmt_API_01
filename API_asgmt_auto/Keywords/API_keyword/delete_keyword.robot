***Keywords***
Delete Assets With AssetID
    Create Session          DeleteAssets            http://localhost:8082
    ${token}=               Login To Get Token
    ${token_headers}=       Create Dictionary       token=${token}
    ${request_body}=        Create Dictionary       assetId=ar67      assetName=Smart Robot   assetType=9     inUse=true
    ${del_resp}=            DELETE On Session       DeleteAssets   /assets/ar67        headers=${token_headers}     json=${request_body}     expected_status=200
    ${status}=              Set Variable            ${del_resp.json()['status']} 
    ${message}=             Set Variable            ${del_resp.json()['message']}
    Should Be Equal         ${del_resp.json()['status']}    success
    Log To Console          .
    Log To Console          Valid 🟢
    Log To Console          HTTP code : ${del_resp} 
    Log to console          Status : ${status}
    Log to console          Message : ${message} ""

Delete Assets With Not Exists AssetID
    Create Session          DeleteAssets            http://localhost:8082
    ${token}=               Login To Get Token
    ${token_headers}=       Create Dictionary       token=${token}
    ${request_body}=        Create Dictionary       assetId=UNKNOW      assetName=Smart Robot   assetType=9     inUse=true
    ${del_resp}=            DELETE On Session       DeleteAssets   /assets/ar67        headers=${token_headers}     json=${request_body}     expected_status=200
    ${status}=              Set Variable            ${del_resp.json()['status']} 
    ${message}=             Set Variable            ${del_resp.json()['message']}
    Should Be Equal         ${del_resp.json()['status']}    failed
    Log To Console          .
    Log To Console          Invalid [🔴]
    Log To Console          HTTP code : ${del_resp} 
    Log to console          Status : ${status}
    Log to console          Message : ${message}