***Keywords***
Get Assets List Data With Token
    Create Session          GetAssets               ${url}
    ${token}=               Login To Get Token
    ${token_headers}=       Create Dictionary       token=${token}
    ${get_resp}=            GET On Session          GetAssets   /assets     headers=${token_headers}    expected_status=200
    ${count}=               Get Length              ${get_resp.json()}
    ${morethanone}          Evaluate                ${count}>0
    Should Be True          ${morethanone}
    Log To Console          Valid 🟢
    Log To Console          HTTP code : ${get_resp} 
    Log To Console          Assets Data = ${count}

Get Assets List Data No Token
    Create Session          GetAssets                 ${url}
    ${token}=               Login To Get Token  
    ${invalid_token}        Set Variable              ${old_token}
    ${invalid_headers}      Create Dictionary         token=${invalid_token}
    ${get_resp}=            GET On Session            GetAssets    /assets     headers=${invalid_headers}    expected_status=401
    ${token}=               Set Variable              ${get_resp.json()['message']}
    ${status}=              Set Variable              ${get_resp.json()['status']}
    Should Be Equal         ${get_resp.json()['status']}    error
    Should Be Equal         ${get_resp.json()['message']}   you do not have access to this resource
    Log To Console          .
    Log To Console          Invalid 🔴
    Log To Console          HTTP code : ${get_resp} 
    Log to console          Status = ${status}
    Log to console          Message = ${token}

