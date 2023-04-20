// Copyright (c) 2023, WSO2 LLC. (http://www.wso2.com).

// WSO2 LLC. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at

// http://www.apache.org/licenses/LICENSE-2.0

// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/log;
import ballerina/test;
import ballerina/os;
import ballerina/io;

configurable string org_name = os:getEnv("ORG_NAME");
configurable string clientId = os:getEnv("CLIENT_ID");
configurable string clientSecret = os:getEnv("CLIENT_SECRET");

string[] scope = [
    "internal_user_mgt_view",
    "internal_user_mgt_list",
    "internal_user_mgt_create",
    "internal_user_mgt_delete",
    "internal_user_mgt_update",
    "internal_user_mgt_delete",
    "internal_group_mgt_view",
    "internal_group_mgt_list",
    "internal_group_mgt_create",
    "internal_group_mgt_delete",
    "internal_group_mgt_update",
    "internal_group_mgt_delete"
];
string CreatedUserId = "";
string CreatedGroupId = "";

ConnectorConfig scimConfig = {
    orgName: org_name,
    clientId: clientId,
    clientSecret: clientSecret,
    scope: scope
};

Client scimClient = check new (scimConfig);

@test:Config {}
function testGetUsers() returns error? {
    io:println(CreatedUserId);
    log:printInfo("scimClient.getUsers()");
    UserResponse response = check scimClient.getUsers();
    log:printInfo(response.toString());
}

@test:Config {}
function testGetUser() returns error? {
    log:printInfo("scimClient.getUser()");
    UserResource response = check scimClient.getUser(testUserId);
    log:printInfo(response.toString());
}

@test:Config {enable: false}
function testCreateUser() returns error? {
    log:printInfo("scimClient.createUser()");
    UserResource response = check scimClient.createUser(testCreateUserData);
    CreatedUserId = response.id.toString();
    log:printInfo(response.toString());
}

@test:Config {}
function testUpdateUser() returns error? {
    log:printInfo("scimClient.updateUser()");
    UserResource response = check scimClient.updateUser(testUserId1, testUpdateUserData);
    log:printInfo(response.toString());
}

@test:Config {before: testCreateUser}
function testDeleteUser() returns error? {
    log:printInfo("scimClient.deleteUser()");
    json response = check scimClient.deleteUser(CreatedUserId);
    log:printInfo(response.toString());
}

@test:Config {}
function testPatchUser() returns error? {
    log:printInfo("scimClient.patchUser()");
    UserResponse response = check scimClient.patchUser(testUserId1, testPatchUserData);
    log:printInfo(response.toString());
}

@test:Config {}
function testSearchUser() returns error? {
    log:printInfo("scimClient.searchUser()");
    UserResponse response = check scimClient.searchUser(testSearchUserData);
    log:printInfo(response.toString());
}

@test:Config {}
function testGetGroups() returns error? {
    log:printInfo("scimClient.getGroups()");
    GroupResponse response = check scimClient.getGroups();
    log:printInfo(response.toString());
}

@test:Config {}
function testGetGroup() returns error? {
    log:printInfo("scimClient.getGroup()");
    GroupResource response = check scimClient.getGroup(testGroupId);
    log:printInfo(response.toString());
}

@test:Config {enable: false}
function testCreateGroup() returns error? {
    log:printInfo("scimClient.createGroup()");
    GroupResource response = check scimClient.createGroup(testCreateGroupData);
    CreatedGroupId = response.id.toString();
    log:printInfo(response.toString());
}

@test:Config {}
function testUpdateGroup() returns error? {
    log:printInfo("scimClient.updateGroup()");
    GroupResource response = check scimClient.updateGroup(testGroupId, testUpdateGroupData);
    log:printInfo(response.toString());
}

@test:Config {before: testCreateGroup}
function testDeleteGroup() returns error? {
    log:printInfo("scimClient.deleteGroup()");
    json response = check scimClient.deleteGroup(CreatedGroupId);
    log:printInfo(response.toString());
}

@test:Config {}
function testPatchGroup() returns error? {
    log:printInfo("scimClient.patchGroup()");
    GroupResponse response = check scimClient.patchGroup(testGroupId, testPatchGroupData);
    log:printInfo(response.toString());
}

@test:Config {}
function testSearchGroup() returns error? {
    log:printInfo("scimClient.searchGroup()");
    GroupResponse response = check scimClient.searchGroup(testSearchGroupData);
    log:printInfo(response.toString());
}

@test:Config {}
function testBulk() returns error? {
    log:printInfo("scimClient.bulk()");
    BulkResponse response = check scimClient.bulk(testBulkData);
    log:printInfo(response.toString());
}

