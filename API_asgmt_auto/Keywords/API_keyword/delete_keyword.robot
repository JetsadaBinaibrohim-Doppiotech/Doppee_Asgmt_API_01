***Keywords***
Delete Assets With AssetID
    Create Session          DeleteAssets            ${url}
    ${token}=               Login To Get Token
    ${token_headers}=       Create Dictionary       token=${token}
    ${request_body}=        Create Dictionary       assetId=${asst_id_delete}     assetName=${asst_name}   assetType=${asst_type}     inUse=${in_use}
    ${del_resp}=            DELETE On Session       DeleteAssets   /assets/${asst_id_delete}       headers=${token_headers}     json=${request_body}     expected_status=200
    ${status}=              Set Variable            ${del_resp.json()['status']} 
    ${message}=             Set Variable            ${del_resp.json()['message']}
    Should Be Equal         ${del_resp.json()['status']}    success
    Log To Console          .
    Log To Console          Valid 🟢
    Log To Console          HTTP code : ${del_resp} 
    Log to console          Status : ${status}
    Log to console          Message : ${message} ""

Delete Assets With Not Exists AssetID
    Create Session          DeleteAssets            ${url}
    ${token}=               Login To Get Token
    ${token_headers}=       Create Dictionary       token=${token}
    ${request_body}=        Create Dictionary       assetId=${invalid_id}     assetName=${asst_name}   assetType=${asst_type}     inUse=${in_use}
    ${del_resp}=            DELETE On Session       DeleteAssets   /assets/ar67        headers=${token_headers}     json=${request_body}     expected_status=200
    ${status}=              Set Variable            ${del_resp.json()['status']} 
    ${message}=             Set Variable            ${del_resp.json()['message']}
    Should Be Equal         ${del_resp.json()['status']}    failed
    Log To Console          .
    Log To Console          Invalid [🔴]
    Log To Console          HTTP code : ${del_resp} 
    Log to console          Status : ${status}
    Log to console          Message : ${message}