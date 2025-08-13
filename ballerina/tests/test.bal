// Copyright (c) 2025, WSO2 LLC. (http://www.wso2.com).
//
// WSO2 LLC. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/log;
import ballerina/os;
import ballerina/test;

configurable boolean isTestOnLiveServer = os:getEnv("IS_TEST_ON_ASGARDEO") == "true";

configurable string serviceUrl = isTestOnLiveServer ? os:getEnv("SERVICE_URL") : "http://localhost:443/t/scim2";
configurable string tokenUrl = isTestOnLiveServer ? os:getEnv("TOKEN_URL") : "http://localhost:9444/oauth2/token";
configurable string clientId = isTestOnLiveServer ? os:getEnv("CLIENT_ID") : "dummy";
configurable string clientSecret = isTestOnLiveServer ? os:getEnv("CLIENT_SECRET") : "dummy";

string createdUserId = "";
string createdGroupId = "";

Client scim = test:mock(Client);

@test:BeforeSuite
function initializeClientsForMockServer() returns error? {
    if isTestOnLiveServer {
        log:printInfo("Initializing client for Asgardeo server");
        scim = check new (serviceUrl = serviceUrl,
            config = {
                auth: {
                    tokenUrl,
                    clientId,
                    clientSecret,
                    scopes: [
                        "internal_user_mgt_list",
                        "internal_user_mgt_view",
                        "internal_user_mgt_create",
                        "internal_user_mgt_update",
                        "internal_user_mgt_delete",
                        "internal_group_mgt_list",
                        "internal_group_mgt_view",
                        "internal_group_mgt_create",
                        "internal_group_mgt_update",
                        "internal_group_mgt_delete",
                        "internal_bulk_resource_create",
                        "internal_bulk_resource_delete"
                    ]
                }
            }
        );
    } else {
        log:printInfo("Initializing client for mock server");
        scim = check new (serviceUrl = serviceUrl,
            config = {
                auth: {
                    tokenUrl,
                    clientId,
                    clientSecret
                }
            }
        );
    }

}

@test:Config {
}
public function testGetUsers() returns error? {
    UserObjectListResponseObject response = check scim->/Users();
    test:assertFalse(response.Resources is (), msg = "Expected a non-empty list of users");
}

@test:Config {
}
public function testPostUsers() returns error? {
    UserObject user = {
        name: {
            givenName: "Kim",
            familyName: "Berry"
        },
        userName: "DEFAULT/kim@gmail.com",
        password: "aBcd!23#",
        emails: [
            {
                "value": "kim@gmail.com",
                "primary": true
            }
        ]
    };

    UserResponseObject response = check scim->/Users.post(user);
    test:assertTrue(response.id is string, msg = "Expected a valid user ID in the response");
    createdUserId = response.id ?: "";
}

@test:Config {
    dependsOn: [testPostUsers]
}
public function testGetUserById() returns error? {
    UserResponseObject userResponse = check scim->/Users/[createdUserId].get();
    test:assertTrue(userResponse.name?.givenName == "Kim", msg = "Expected given name to be Kim");
}

@test:Config {
    dependsOn: [testPostUsers]
}
public function testPutUser() returns error? {
    UserUpdateObject userUpdate = {
        userName: "DEFAULT/kim@gmail.com",
        name: {
            givenName: "Kimberly",
            familyName: "Berry"
        }
    };

    UserResponseObject userResponseObject = check scim->/Users/[createdUserId].put(userUpdate);
    test:assertTrue(userResponseObject.name?.givenName == "Kimberly", msg = "Expected updated given name to be Kimberly");
}

@test:Config {
    dependsOn: [testPutUser]
}
public function testPatchUser() returns error? {
    PatchOperationInput userUpdate = {
        Operations: [
            {
                op: "replace",
                value: {
                    "name": {
                        givenName: "Kimberly3"
                    }
                }
            }
        ]
    };

    UserResponseObject userResponseObject = check scim->/Users/[createdUserId].patch(userUpdate);
    test:assertTrue(userResponseObject.name?.givenName == "Kimberly3", msg = "Expected updated given name to be Kimberly");
}

@test:Config {
    dependsOn: [testPatchUser]
}
public function testDeleteUser() returns error? {
    error? response = check scim->/Users/[createdUserId].delete();
    test:assertTrue(response is (), msg = "Expected successful deletion of user");
}

@test:Config {
    dependsOn: [testDeleteUser]
}
public function testSearchUsers() returns error? {
    UserSearchRequestObject userSearchRequest = {
        schemas: [
            "urn:ietf:params:scim:api:messages:2.0:SearchRequest"
        ],
        filter: "userName eq \"DEFAULT/kim@gmail.com\""
    };
    UserObjectListResponseObject userResponse = check scim->/Users/\.search.post(userSearchRequest);
    test:assertTrue(userResponse.Resources is (), msg = "Expected a non-empty list of users from search");
}

@test:Config {}
public function testGetGroups() returns error? {
    GroupsListResponseObject response = check scim->/Groups();
    test:assertFalse(response.Resources is (), msg = "Expected a non-empty list of groups");
}

@test:Config {}
public function testPostGroups() returns error? {
    GroupRequestObject group = {
        schemas: ["urn:ietf:params:scim:schemas:core:2.0:Group"],
        displayName: "DEFAULT/TestGroup",
        members: []
    };
    GroupResponseObject response = check scim->/Groups.post(group);
    test:assertTrue(response.id is string, msg = "Expected a valid group ID in the response");
    createdGroupId = response.id ?: "";
}

@test:Config {
    dependsOn: [testPostGroups]
}
public function testGetGroupById() returns error? {
    GroupResponseObject groupResponse = check scim->/Groups/[createdGroupId].get();
    test:assertTrue(groupResponse.displayName == "DEFAULT/TestGroup", msg = "Expected display name to be TestGroup");
}

@test:Config {
    dependsOn: [testPostGroups]
}
public function testPutGroup() returns error? {
    GroupPutRequestObject groupUpdate = {
        displayName: "DEFAULT/UpdatedTestGroup",
        members: []
    };
    GroupPutResponseObject groupResponseObject = check scim->/Groups/[createdGroupId].put(groupUpdate);
    test:assertTrue(groupResponseObject.displayName == "DEFAULT/UpdatedTestGroup", msg = "Expected updated display name to be DEFAULT/UpdatedTestGroup");
}

@test:Config {
    dependsOn: [testPutGroup]
}
public function testPatchGroup() returns error? {
    PatchGroupOperationRequestObject groupUpdate = {
        schemas: [
            "urn:ietf:params:scim:api:messages:2.0:PatchOp"
        ],
        Operations: [
            {
                op: "replace",
                value: {
                    "displayName": "DEFAULT/PatchedTestGroup"
                }
            }
        ]
    };
    PatchGroupOperationResponseObject groupResponseObject = check scim->/Groups/[createdGroupId].patch(groupUpdate);
    test:assertTrue(groupResponseObject.displayName == "DEFAULT/PatchedTestGroup", msg = "Expected patched display name to be PatchedTestGroup");
}

@test:Config {
    dependsOn: [testPutGroup]
}
public function testDeleteGroup() returns error? {
    error? response = check scim->/Groups/[createdGroupId].delete();
    test:assertTrue(response is (), msg = "Expected successful deletion of group");
}

@test:Config {
    dependsOn: [testDeleteGroup]
}
public function testSearchGroups() returns error? {
    GroupSearchRequestObject groupSearchRequest = {
        schemas: [
            "urn:ietf:params:scim:api:messages:2.0:SearchRequest"
        ],
        filter: "displayName eq \"TestGroup\""
    };
    GroupSearchResponseObject groupResponse = check scim->/Groups/\.search.post(groupSearchRequest);
    test:assertTrue(groupResponse.Resources is (), msg = "Expected a non-empty list of groups from search");
}

@test:Config {
}
public function testBulkOperations() returns error? {
    BulkGroupCreateObject bulkRequest = {
        schemas: ["urn:ietf:params:scim:api:messages:2.0:BulkRequest"],
        Operations: [
            {
                method: "POST",
                path: "/Users",
                bulkId: "123445",
                data: {
                    displayName: "DEFAULT/BulkGroup",
                    "userName": "bulkgroupuser"
                }
            }
        ]
    };
    BulkUserResponseObject response = check scim->/Bulk.post(bulkRequest);

    OperationObBulk operationObBulk = response.Operations ?: [];
    test:assertTrue(operationObBulk[0].bulkId == "123445", msg = "Expected bulkId to match the request");
}

@test:Config {
}
public function testServiceProviderConfig() returns error? {
    _ = check scim->/ServiceProviderConfig();
}

@test:Config {
}
public function testResourceTypes() returns error? {
    _ = check scim->/ResourceTypes();
}
