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

import ballerina/http;

# This client is used to connect to the SCIM2 APIs of Asgardeo for Inbound User Provisioning.
@display {label: "SCIM Client Connector"}
public class Client {
    private final string orgName;
    private final string clientId;
    private final string clientSecret;
    private final string[] scope;
    // final oauth2:ClientOAuth2Provider provider;
    final http:Client clientEndpoint;

    # Initializes the SCIM client.
    #
    # + orgName - The name of the organization
    # + clientId - The client ID of the application
    # + clientSecret - The client secret of the application
    # + scope - Permitted scopes
    public isolated function init(string orgName, string clientId, string clientSecret, string[] scope) returns error? {
        self.orgName = orgName;
        self.clientId = clientId;
        self.clientSecret = clientSecret;
        self.scope = scope;
        http:OAuth2ClientCredentialsGrantConfig config = {
            tokenUrl: string `${HOST_URL}/${TENANT_PATH}/${self.orgName}/oauth2/token`,
            clientId: clientId,
            clientSecret: clientSecret,
            scopes: scope
        };
        self.clientEndpoint = check new (string `${HOST_URL}/${TENANT_PATH}/${self.orgName}/${SCIM}`, {auth: config, httpVersion: "1.1"});
    }

    # Gets the list of users.
    #
    # + return - The list of users
    @display {label: "Get Users"}
    public isolated function getUsers() returns UserResponse|error {
        UserResponse response = check self.clientEndpoint->get(USERS);
        return response;
    }

    # Gets a user by the user ID.
    #
    # + id - The ID of the user
    # + return - The user
    @display {label: "Get User by ID"}
    public isolated function getUser(@display {label: "User Id"} string id) returns UserResource|error {
        UserResource response = check self.clientEndpoint->get(string `${USERS}/${id}`);
        return response;
    }

    # Creates a user.
    #
    # + data - The user data
    # + return - The created user
    @display {label: "Create User"}
    public isolated function createUser(@display {label: "User data"} SCIMUser data) returns UserResource|error {
        UserResource response = check self.clientEndpoint->post(USERS, data);
        return response;
    }

    # Updates a user.
    #
    # + id - The ID of the user
    # + data - The user data to be updated
    # + return - The updated user
    @display {label: "Update User"}
    public isolated function updateUser(@display {label: "User Id"} string id, @display {label: "User updated data"} UserUpdate data) returns UserResource|error {
        UserResource response = check self.clientEndpoint->put(string `${USERS}/${id}`, data);
        return response;
    }

    # Deletes a user.
    #
    # + id - The ID of the user
    # + return - The response
    @display {label: "Delete User"}
    public isolated function deleteUser(@display {label: "User Id"} string id) returns json|error {
        json response = check self.clientEndpoint->delete(string `${USERS}/${id}`);
        return response;
    }

    # Patches a user.
    #
    # + id - The ID of the user
    # + data - The user data to be patched
    # + return - The patched user
    @display {label: "Patch User"}
    public isolated function patchUser(@display {label: "User Id"} string id, @display {label: "Patch data"} UserPatch data) returns UserResponse|error {
        UserResponse response = check self.clientEndpoint->patch(string `${USERS}/${id}`, data);
        return response;
    }

    # Searches for a user.
    #
    # + data - The search data
    # + return - The list of users
    @display {label: "Search User"}
    public isolated function searchUser(@display {label: "Search Data"} UserSearch data) returns UserResponse|error {
        UserResponse|error response = self.clientEndpoint->post(string `${USERS}/.search`, data);
        return response;
    }

    # Gets the list of groups.
    #
    # + return - The list of groups
    @display {label: "Get Groups"}
    public isolated function getGroups() returns GroupResponse|error {
        GroupResponse|error response = self.clientEndpoint->get(GROUPS);
        return response;
    }

    # Gets a group by the group ID.
    #
    # + id - The ID of the group
    # + return - The group
    @display {label: "Get Group by ID"}
    public isolated function getGroup(@display {label: "Group Id"} string id) returns GroupResource|error {
        GroupResource response = check self.clientEndpoint->get(string `${GROUPS}/${id}`);
        return response;
    }

    # Creates a group.
    #
    # + data - The group data
    # + return - The created group
    @display {label: "Create Group"}
    public isolated function createGroup(@display {label: "Group Data"} SCIMGroup data) returns GroupResource|error {
        GroupResource response = check self.clientEndpoint->post(GROUPS, data);
        return response;
    }

    # Updates a group.
    #
    # + id - The ID of the group
    # + data - The group data to be updated
    # + return - The updated group
    @display {label: "Update Group"}
    public isolated function updateGroup(@display {label: "Group Id"} string id, @display {label: "Updated data"} GroupUpdate data) returns GroupResource|error {
        GroupResource response = check self.clientEndpoint->put(string `${GROUPS}/${id}`, data);
        return response;
    }

    # Deletes a group.
    #
    # + id - The ID of the group
    # + return - The response
    @display {label: "Delete Group"}
    public isolated function deleteGroup(@display {label: "Group Id"} string id) returns json|error {
        json response = check self.clientEndpoint->delete(string `${GROUPS}/${id}`);
        return response;
    }

    # Patches a group.
    #
    # + id - The ID of the group
    # + data - The group data to be patched
    # + return - The patched group
    @display {label: "Patch Group"}
    public isolated function patchGroup(@display {label: "Group Id"} string id, @display {label: "Patch data"} GroupPatch data) returns GroupResponse|error {
        GroupResponse response = check self.clientEndpoint->patch(string `${GROUPS}/${id}`, data);
        return response;
    }

    # Searches for a group.
    #
    # + data - The search data
    # + return - The list of groups
    @display {label: "Search Group"}
    public isolated function searchGroup(@display {label: "Search data"} GroupSearch data) returns GroupResponse|error {
        GroupResponse response = check self.clientEndpoint->post(string `${GROUPS}/.search`, data);
        return response;
    }

    # Gets the list of service providers.
    #
    # + data - The data for bulk operation
    # + return - The response of the operation
    @display {label: "Bulk Operation"}
    public isolated function bulk(@display {label: "Bulk operation data"} Bulk data) returns BulkResponse|error {
        BulkResponse response = check self.clientEndpoint->post(BULK, data);
        return response;
    }
}
