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

final string & readonly testUserId = "892b2a2f-8b4d-4df6-b414-c7a7479f29c8";

final string & readonly testUserId1 = "d29e781f-aa97-4449-ae85-139b67533ce1";

final string & readonly testUserId2 = "139b67533ce1";

final string & readonly testGroupId = "1fd8d238-8128-4386-8b0d-81246c6eb41d";

final string & readonly testGroupId1 = "81246c6eb41d";

final UserCreate & readonly testCreateUserData = {
    schemas: [],
    name: {
        givenName: "Kim11",
        familyName: "Berry11"
    },
    userName: "DEFAULT/kim00@gmail.com",
    password: "aBcd!23455",
    emails: [
        {
            'type: "home",
            value: "kim1@gmail.com",
            primary: true
        },
        {
            'type: "work",
            value: "kim1@wso2.com"
        }
    ],
    urn\:ietf\:params\:scim\:schemas\:extension\:enterprise\:2\.0\:User: {
        employeeNumber: "1234A",
        manager: {
            value: "Taylor"
        }
    }

};

final UserUpdate & readonly testUpdateUserData = {
    name: {
        givenName: "Kim9997",
        familyName: "Berry"
    },
    userName: "DEFAULT/kim19906@gmail.com"
};

final UserPatch & readonly testPatchUserData = {
    schemas: [
        "urn:ietf:params:scim:api:messages:2.0:PatchOp"
    ],
    Operations: [
        {
            op: "add",
            value: {
                "nickName": "Hellen"
            }
        }
    ]
};

final UserSearch & readonly testSearchUserData = {
    schemas: [
        "urn:ietf:params:scim:api:messages:2.0:SearchRequest"
    ],
    attributes: [
        "name.familyName",
        "userName"
    ],
    filter: "userName sw ki",
    domain: "PRIMARY",
    startIndex: 1,
    count: 10
};

final GroupCreate & readonly testCreateGroupData = {
    schemas: [
        "urn:ietf:params:scim:schemas:core:2.0:Group"
    ],
    displayName: "DEFAULT/Members",
    members: [
        {
            value: "892b2a2f-8b4d-4df6-b414-c7a7479f29c8",
            display: "DEFAULT/bjensen@example.com"
        }

    ]
};

final GroupUpdate & readonly testUpdateGroupData = {
    displayName: "DEFAULT/team"
};

final GroupPatch & readonly testPatchGroupData = {
    schemas: [
        "urn:ietf:params:scim:api:messages:2.0:PatchOp"
    ],
    Operations: [
        {
            op: "add",
            value: {
                members: [
                    {
                        display: "DEFAULT/kasunii@gmail.com",
                        value: "0f972374-12b2-4024-87be-d447ccb75a25"
                    }
                ]
            }
        }
    ]
};

final GroupSearch & readonly testSearchGroupData = {
    schemas: [
        "urn:ietf:params:scim:api:messages:2.0:SearchRequest"
    ],
    startIndex: 1,
    filter: "displayName eq manager"
};

final Bulk & readonly testBulkData = {
    failOnErrors: 1,
    schemas: [
        "urn:ietf:params:scim:api:messages:2.0:BulkRequest"
    ],
    Operations: [
        {
            method: "POST",
            path: "/Users",
            bulkId: "qwerty",
            data: {
                schemas: [
                    "urn:ietf:params:scim:schemas:core:2.0:User"
                ],
                userName: "DEFAULT/Kim",
                password: "Kimm@123",
                name: {
                    givenName: "Kim",
                    familyName: "Berry"
                }

            }
        },
        {
            method: "POST",
            path: "/Users",
            bulkId: "ytrewq",
            data: {
                schemas: [
                    "urn:ietf:params:scim:schemas:core:2.0:User",
                    "urn:ietf:params:scim:schemas:extension:enterprise:2.0:User"
                ],
                name: {
                    givenName: "Smith",
                    familyName: "Berry"
                },
                userName: "DEFAULT/smith",
                password: "Smith@123",
                emails: [
                    {
                        'type: "home",
                        value: "smith@gmail.com",
                        primary: true
                    },
                    {
                        'type: "work",
                        value: "smith@wso2.com"
                    }
                ],
                urn\:ietf\:params\:scim\:schemas\:extension\:enterprise\:2\.0\:User: {
                    "employeeNumber": "1234A",
                    "manager": {
                        "value": "Taylor"
                    }
                }
            }
        }
    ]
};
