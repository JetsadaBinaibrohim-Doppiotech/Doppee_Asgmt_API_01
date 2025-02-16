*** Settings ***
Library     RequestsLibrary
Library     Collections


Resource    ./Keywords/API_keyword/createasset_keyword.robot
Resource    ./Keywords/API_keyword/delete_keyword.robot
Resource    ./Keywords/API_keyword/getasset_keyword.robot
Resource    ./Keywords/API_keyword/logintoken_keyword.robot
Resource    ./Keywords/API_keyword/modify_keyword.robot

Resource    ./Keywords/common_keyword.robot

Resource    ./Keywords/API_feature/tc01_feature.robot
Resource    ./Keywords/API_feature/tc02_feature.robot
Resource    ./Keywords/API_feature/tc03_feature.robot
Resource    ./Keywords/API_feature/tc04_feature.robot
Resource    ./Keywords/API_feature/tc05_feature.robot
Resource    ./Keywords/API_feature/tc06_feature.robot
Resource    ./Keywords/API_feature/tc07_feature.robot
Resource    ./Keywords/API_feature/tc08_feature.robot