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
public isolated client class Client {
    final http:Client clientEndpoint;

    # Initializes the SCIM client.
    #
    # + connectorConfig - The connector configuration
    public isolated function init(ConnectorConfig connectorConfig) returns error? {
        http:OAuth2ClientCredentialsGrantConfig config = {
            tokenUrl: string `${HOST_URL}/${TENANT_PATH}/${connectorConfig.orgName}/oauth2/token`,
            clientId: connectorConfig.clientId,
            clientSecret: connectorConfig.clientSecret,
            scopes: connectorConfig.scope
        };
        self.clientEndpoint = check new (string `${HOST_URL}/${TENANT_PATH}/${connectorConfig.orgName}/${SCIM}`, {auth: config, httpVersion: "1.1"});
    }

    # Filter the users.
    #
    # + attributes - SCIM defined attributes parameter  
    # + count - Specifies the desired maximum number of query results per page  
    # + domain - The name of the user store where filtering needs to be applied  
    # + excludedAttributes - SCIM defined excludedAttribute parameter  
    # + filter - Filter expression for filtering  
    # + startIndex - The 1-based index of the first query result
    # + return - The list of users
    @display {label: "Get Users"}
    remote isolated function getUsers(@display {label: "Attributes"} string[]? attributes = (), @display {label: "Count"} int? count = (), @display {label: "Domain"} string? domain = "DEFAULT", @display {label: "Excluded Attributes"} string[]? excludedAttributes = (), @display {label: "Filter"} string? filter = (), @display {label: "Start Index"} int? startIndex = ()) returns UserResponse|ErrorResponse|error {
        string attr = attributes is () ? "attributes" : string `attributes=${getparams(attributes)}`;
        string cnt = count is () ? "count" : string `count=${count}`;
        string dom = domain is () ? "domain" : string `domain=${domain}`;
        string exAttr = excludedAttributes is () ? "excludedAttributes" : string `excludedAttributes=${getparams(excludedAttributes)}`;
        string fltr = filter is () ? "filter" : string `filter=${filter}`;
        string stIdx = startIndex is () ? "startIndex" : string `startIndex=${startIndex}`;
        UserResponse|http:ClientError response = self.clientEndpoint->get(string `${USERS}?${attr}&${cnt}&${dom}&${exAttr}&${fltr}&${stIdx}`);
        if (response is UserResponse) {
            return response;
        }
        return getErrorResponse(response);
    }

    # Gets a user by the user ID.
    #
    # + id - The ID of the user  
    # + attributes - SCIM defined attributes parameter  
    # + excludedAttributes - SCIM defined excludedAttribute parameter 
    # + return - The user
    @display {label: "Get User by ID"}
    remote isolated function getUser(@display {label: "User Id"} string id, @display {label: "Attributes"} string[]? attributes = (), @display {label: "Excluded Attributes"} string[]? excludedAttributes = ()) returns UserResource|ErrorResponse|error {
        string attr = attributes is () ? "attributes" : string `attributes=${getparams(attributes)}`;
        string exAttr = excludedAttributes is () ? "excludedAttributes" : string `excludedAttributes=${getparams(excludedAttributes)}`;
        UserResource|http:ClientError response = self.clientEndpoint->get(string `${USERS}/${id}?${attr}&${exAttr}`);
        if (response is UserResource) {
            return response;
        }
        return getErrorResponse(response);
    }

    # Creates a user.
    #
    # + data - The user data
    # + return - The created user
    @display {label: "Create User"}
    remote isolated function createUser(@display {label: "User data"} UserCreate data) returns UserResource|ErrorResponse|error {
        UserResource|http:ClientError response = self.clientEndpoint->post(USERS, data);
        if (response is UserResource) {
            return response;
        }
        return getErrorResponse(response);
    }

    # Updates user data.
    #
    # + id - The ID of the user
    # + data - The user data to be updated
    # + return - The updated user
    @display {label: "Update User"}
    remote isolated function updateUser(@display {label: "User Id"} string id, @display {label: "User updated data"} UserUpdate data) returns UserResource|ErrorResponse|error {
        UserPatch userPatch = {
            schemas: [
                "urn:ietf:params:scim:api:messages:2.0:PatchOp"
            ],
            Operations: [
                {
                    op: "replace",
                    value: data
                }
            ]
        };
        UserResource|http:ClientError response = self.clientEndpoint->patch(string `${USERS}/${id}`, userPatch);
        if (response is UserResource) {
            return response;
        }
        return getErrorResponse(response);
    }

    # Deletes a user.
    #
    # + id - The ID of the user
    # + return - The response
    @display {label: "Delete User"}
    remote isolated function deleteUser(@display {label: "User Id"} string id) returns ErrorResponse|error? {
        http:ClientError? response = self.clientEndpoint->delete(string `${USERS}/${id}`);
        if (response is ()) {
            return response;
        }
        return getErrorResponse(response);
    }

    # Patches user data.
    #
    # + id - The ID of the user
    # + data - The user data to be patched
    # + return - The patched user
    @display {label: "Patch User"}
    remote isolated function patchUser(@display {label: "User Id"} string id, @display {label: "Patch data"} UserPatch data) returns UserResponse|ErrorResponse|error {
        UserResponse|http:ClientError response = self.clientEndpoint->patch(string `${USERS}/${id}`, data);
        if (response is UserResponse) {
            return response;
        }
        return getErrorResponse(response);
    }

    # Searches for a user.
    #
    # + data - The search data
    # + return - The list of users
    @display {label: "Search User"}
    remote isolated function searchUser(@display {label: "Search Data"} UserSearch data) returns UserResponse|ErrorResponse|error {
        UserResponse|http:ClientError response = self.clientEndpoint->post(string `${USERS}/.search`, data);
        if (response is UserResponse) {
            return response;
        }
        return getErrorResponse(response);
    }

    # Filter the groups.
    #
    # + attributes - SCIM defined attributes parameter  
    # + count - Specifies the desired maximum number of query results per page  
    # + domain - The name of the user store where filtering needs to be applied  
    # + excludedAttributes - SCIM defined excludedAttribute parameter  
    # + filter - Filter expression for filtering  
    # + startIndex - The 1-based index of the first query result
    # + return - The list of groups
    @display {label: "Get Groups"}
    remote isolated function getGroups(@display {label: "Attributes"} string[]? attributes = (), @display {label: "Count"} int? count = (), @display {label: "Domain"} string? domain = (), @display {label: "Excluded Attributes"} string[]? excludedAttributes = (), @display {label: "Filter"} string? filter = (), @display {label: "Start Index"} int? startIndex = ()) returns GroupResponse|ErrorResponse|error {
        string attr = attributes is () ? "attributes" : string `attributes=${getparams(attributes)}`;
        string cnt = count is () ? "count" : string `count=${count}`;
        string dom = domain is () ? "domain" : string `domain=${domain}`;
        string exAttr = excludedAttributes is () ? "excludedAttributes" : string `excludedAttributes=${getparams(excludedAttributes)}`;
        string fltr = filter is () ? "filter" : string `filter=${filter}`;
        string stIdx = startIndex is () ? "startIndex" : string `startIndex=${startIndex}`;
        GroupResponse|http:ClientError response = self.clientEndpoint->get(string `${GROUPS}?${attr}&${cnt}&${dom}&${exAttr}&${fltr}&${stIdx}`);
        if (response is GroupResponse) {
            return response;
        }
        return getErrorResponse(response);
    }

    # Gets a group by the group ID.
    #
    # + id - The ID of the group  
    # + attributes - SCIM defined attributes parameter  
    # + excludedAttributes - SCIM defined excludedAttribute parameter 
    # + return - The group
    @display {label: "Get Group by ID"}
    remote isolated function getGroup(@display {label: "Group Id"} string id, @display {label: "Attributes"} string[]? attributes = (), @display {label: "Excluded Attributes"} string[]? excludedAttributes = ()) returns GroupResource|ErrorResponse|error {
        string attr = attributes is () ? "attributes" : string `attributes=${getparams(attributes)}`;
        string exAttr = excludedAttributes is () ? "excludedAttributes" : string `excludedAttributes=${getparams(excludedAttributes)}`;
        GroupResource|http:ClientError response = self.clientEndpoint->get(string `${GROUPS}/${id}?${attr}&${exAttr}`);
        if (response is GroupResource) {
            return response;
        }
        return getErrorResponse(response);
    }

    # Creates a group.
    #
    # + data - The group data
    # + return - The created group
    @display {label: "Create Group"}
    remote isolated function createGroup(@display {label: "Group Data"} GroupCreate data) returns GroupResource|ErrorResponse|error {
        GroupResource|http:ClientError response = self.clientEndpoint->post(GROUPS, data);
        if (response is GroupResource) {
            return response;
        }
        return getErrorResponse(response);
    }

    # Updates a group.
    #
    # + id - The ID of the group
    # + data - The group data to be updated
    # + return - The updated group
    @display {label: "Update Group"}
    remote isolated function updateGroup(@display {label: "Group Id"} string id, @display {label: "Updated data"} GroupUpdate data) returns GroupResource|error {
        GroupPatch groupPatch = {
            Operations: [
                {
                    op: "replace",
                    value: data
                }
            ]
        };
        GroupResource|http:ClientError response = self.clientEndpoint->patch(string `${GROUPS}/${id}`, groupPatch);
        if (response is GroupResource) {
            return response;
        }
        return getErrorResponse(response);
    }

    # Deletes a group.
    #
    # + id - The ID of the group
    # + return - The response
    @display {label: "Delete Group"}
    remote isolated function deleteGroup(@display {label: "Group Id"} string id) returns ErrorResponse|error? {
        http:ClientError? response = self.clientEndpoint->delete(string `${GROUPS}/${id}`);
        if (response is http:ClientError) {
            return getErrorResponse(response);
        }
    }

    # Patches a group.
    #
    # + id - The ID of the group
    # + data - The group data to be patched
    # + return - The patched group
    @display {label: "Patch Group"}
    remote isolated function patchGroup(@display {label: "Group Id"} string id, @display {label: "Patch data"} GroupPatch data) returns GroupResponse|ErrorResponse|error {
        GroupResponse|http:ClientError response = self.clientEndpoint->patch(string `${GROUPS}/${id}`, data);
        if (response is GroupResponse) {
            return response;
        }
        return getErrorResponse(response);
    }

    # Searches for a group.
    #
    # + data - The search data
    # + return - The list of groups
    @display {label: "Search Group"}
    remote isolated function searchGroup(@display {label: "Search data"} GroupSearch data) returns GroupResponse|ErrorResponse|error {
        GroupResponse|http:ClientError response = self.clientEndpoint->post(string `${GROUPS}/.search`, data);
        if (response is GroupResponse) {
            return response;
        }
        return getErrorResponse(response);
    }

    # Performs a bulk operation.
    #
    # + data - The data for bulk operation
    # + return - The response of the operation
    @display {label: "Bulk Operation"}
    remote isolated function bulk(@display {label: "Bulk operation data"} Bulk data) returns BulkResponse|ErrorResponse|error {
        BulkResponse|http:ClientError response = self.clientEndpoint->post(BULK, data);
        if (response is BulkResponse) {
            return response;
        }
        return getErrorResponse(response);
    }
}