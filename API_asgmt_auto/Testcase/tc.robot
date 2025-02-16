***Settings***
Resource            ../import.robot

***Test Cases***
TC-001 Verify when input wrong username or password, API should return error
    [Tags]      InvalidData
    Verify User Input Invalid data Should Return Error
TC-002 Verify That Can Get Asset List From Get API correctly
    [Tags]      GetAssets
    Verify User Get Assets List Correctly
TC-003 Verify that get asset API always require Invalid token
    [Tags]      InvalidToken
    Verify User Can't Get Assets List With No Token
TC-004 Verify that create asset API can work correctly 
    [Tags]      CreateAssets
    Verify User Create New Assets Correctly
TC-005 Verify that cannot create asset with duplicated ID 
    [Tags]      CreateDuplicate
    Verify User Can't Use Duplicated ID 
TC-006 Verify that modify asset API can work correctly 
    [Tags]      ModifyAssets
    Verify User Modify Assets Correctly
TC-007 Verify that delete asset API can work correctly
    [Tags]      DeleteAssets
    Verify User Can Delete Asset Correctly
TC-008 Verify that cannot delete asset which ID does not exists 
    [Tags]      DeleteFailed
    Verify User Can't Delete Asset While ID Not Exists