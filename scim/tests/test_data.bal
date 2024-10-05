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

final string & readonly testGroupId = "6918f07a-c772-44d9-8f51-264861993cd2";

final string[] & readonly scope = [
    "internal_user_mgt_view",
    "internal_user_mgt_list",
    "internal_user_mgt_create",
    "internal_user_mgt_delete",
    "internal_user_mgt_update",
    "internal_group_mgt_view",
    "internal_group_mgt_list",
    "internal_group_mgt_create",
    "internal_group_mgt_delete",
    "internal_group_mgt_update"
];

final UserCreate & readonly testCreateUserData = {
    schemas: [],
    name: {
        givenName: "Kim",
        familyName: "Berry"
    },
    userName: "DEFAULT/kimberry00@gmail.com",
    password: "aBcd!23455",
    emails: [
        {
            'type: "home",
            value: "kimberry@gmail.com",
            primary: true
        },
        {
            'type: "work",
            value: "kim11@wso2.com"
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
    }
};

final UserPatch testPatchUserData = {
    Operations: [
        {
            op: "add",
            value: {
                "nickName": "Hellen"
            }
        }
    ]
};

final UserSearch testSearchUserData = {
    attributes: [
        "name.familyName",
        "userName"
    ],
    filter: "userName sw ki",
    domain: "PRIMARY",
    startIndex: 1,
    count: 10
};

final GroupCreate testCreateGroupData = {
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

final GroupPatch testPatchGroupData = {
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

final GroupSearch testSearchGroupData = {
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
            method: "PUT",
            path: "/Users/4d1c5a37-f407-44f1-af95-bb89a4679239",
            bulkId: "qwerty",
            data: {
                name: {
                    givenName: "Kim9997",
                    familyName: "Berry"
                },
                userName: "DEFAULT/Kimm@gmail.com"

            }
        },
        {
            method: "PUT",
            path: "/Users/c479016c-5d29-437e-9314-48cba56df6ce",
            bulkId: "ytrewq",
            data: {
                name: {
                    givenName: "Smith",
                    familyName: "Berry"
                },
                userName: "DEFAULT/Smith@gmail.com",
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