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

import ballerina/http;
import ballerinax/scim;

configurable string orgName = ?;
configurable string clientId = ?;
configurable string clientSecret = ?;

service /asgardeo on new http:Listener(8080) {

    scim:Client scim;

    function init() returns error? {
        self.scim = check new (serviceUrl = string `https://api.asgardeo.io/t/${orgName}/scim2`,
            config = {
                auth: {
                    tokenUrl: string `https://api.asgardeo.io/t/${orgName}/oauth2/token`,
                    clientId: clientId,
                    clientSecret: clientSecret,
                    scopes: ["internal_user_mgt_create"]
                }
            }
        );
    }

    resource function post createUser(WorkerSummary newHire) returns WorkerSummary|error? {
        scim:UserObject scimUser = {
            userName: string `DEFAULT/${newHire.primaryWorkEmail ?: ""}`,
            password: "aBcd!23#",
            name: {
                givenName: newHire.name
            },
            "title": newHire.businessTitle,
            emails: [{"value": newHire.primaryWorkEmail, "type": "work", "primary": true}]
        };
        scim:UserResponseObject newUser = check self.scim->/Users.post(scimUser);
        newHire.id = newUser.id;
        return newHire;
    }
}

public type WorkerSummary record {
    string primaryWorkPhone?;
    boolean isManager?;
    string primaryWorkEmail?;
    string businessTitle?;
    string href?;
    string name?;
    string id?;
};

