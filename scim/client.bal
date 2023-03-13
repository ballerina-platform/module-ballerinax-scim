import ballerina/oauth2;
import ballerina/http;
import ballerina/io;

# This client is used to connect to the SCIM2 APIs of Asgardeo for Inbound User Provisioning.
@display {label: "SCIM Client Connector"}
public class Client {
    private final string orgName;
    private final string clientId;
    private final string clientSecret;
    private final string[] scope;
    final oauth2:ClientOAuth2Provider provider;
    final http:Client clientEndpoint;
    final map<string> headers;

    # Initializes the SCIM client.
    #
    # + orgName - The name of the organization
    # + clientId - The client ID of the application
    # + clientSecret - The client secret of the application
    # + scope - permitted scopes
    public isolated function init(string orgName, string clientId, string clientSecret, string[] scope) returns error? {
        self.orgName = orgName;
        self.clientId = clientId;
        self.clientSecret = clientSecret;
        self.scope = scope;

        self.provider = new ({
            tokenUrl: "https://api.asgardeo.io/t/" + self.orgName + "/oauth2/token",
            clientId: clientId,
            clientSecret: clientSecret,
            scopes: scope
        });

        self.clientEndpoint = check new ("https://api.asgardeo.io/t/" + self.orgName + "/scim2", {httpVersion: "1.1"});

        string token = check self.provider.generateToken();
        io:print(token);

        self.headers = {
            "accept": "application/scim+json",
            "Authorization": "Bearer " + token
        };
    }

    # Gets the list of users.
    #
    # + return - The list of users
    @display {label: "Get Users"}
    public isolated function getUsers() returns UserResponse|error {
        json|error response = self.clientEndpoint->get("/Users", self.headers, json);
        if (response is json) {
            UserResponse users = check response.cloneWithType(UserResponse);
            return users;
        } else {
            return response;
        }
    }

    # Gets a user by the user ID.
    #
    # + id - The ID of the user
    # + return - The user
    @display {label: "Get User by ID"}
    public isolated function getUser(@display {label: "User Id"} string id) returns UserResource|error {
        json|error response = self.clientEndpoint->get("/Users/" + id, self.headers, json);
        if (response is json) {
            UserResource user = check response.cloneWithType(UserResource);
            return user;
        } else {
            return response;
        }
    }

    # Creates a user.
    #
    # + data - The user data
    # + return - The created user
    @display {label: "Create User"}
    public isolated function createUser(@display {label: "User data"} SCIMUser data) returns UserResource|error {
        json|error response = self.clientEndpoint->post("/Users", data, self.headers, (), json);
        if (response is json) {
            UserResource user = check response.cloneWithType(UserResource);
            return user;
        } else {
            return response;
        }
    }

    # Updates a user.
    #
    # + id - The ID of the user
    # + data - The user data to be updated
    # + return - The updated user
    @display {label: "Update User"}
    public isolated function updateUser(@display {label: "User Id"} string id, @display {label: "User updated data"} UserUpdate data) returns UserResource|error {
        json|error response = self.clientEndpoint->put("/Users/" + id, data, self.headers, (), json);
        if (response is json) {
            UserResource user = check response.cloneWithType(UserResource);
            return user;
        } else {
            return response;
        }
    }

    # Deletes a user.
    #
    # + id - The ID of the user
    # + return - The response
    @display {label: "Delete User"}
    public isolated function deleteUser(@display {label: "User Id"} string id) returns json|error {
        json|error response = self.clientEndpoint->delete("/Users/" + id, (), self.headers, (), json);
        return response;
    }

    # Patches a user.
    #
    # + id - The ID of the user
    # + data - The user data to be patched
    # + return - The patched user
    @display {label: "Patch User"}
    public isolated function patchUser(@display {label: "User Id"} string id, @display {label: "Patch data"} UserPatch data) returns UserResponse|error {
        json|error response = self.clientEndpoint->patch("/Users/" + id, data, self.headers, (), json);
        if (response is json) {
            UserResponse user = check response.cloneWithType(UserResponse);
            return user;
        } else {
            return response;
        }
    }

    # Searches for a user.
    #
    # + data - The search data
    # + return - The list of users
    @display {label: "Search User"}
    public isolated function searchUser(@display {label: "Search Data"} UserSearch data) returns UserResponse|error {
        json|error response = self.clientEndpoint->post("/Users/.search", data, self.headers, (), json);
        if (response is json) {
            UserResponse users = check response.cloneWithType(UserResponse);
            return users;
        } else {
            return response;
        }
    }

    # Gets the list of groups.
    #
    # + return - The list of groups
    @display {label: "Get Groups"}
    public isolated function getGroups() returns GroupResponse|error {
        json|error response = self.clientEndpoint->get("/Groups", self.headers, json);
        if (response is json) {
            GroupResponse groups = check response.cloneWithType(GroupResponse);
            return groups;
        } else {
            return response;
        }
    }

    # Gets a group by the group ID.
    #
    # + id - The ID of the group
    # + return - The group
    @display {label: "Get Group by ID"}
    public isolated function getGroup(@display {label: "Group Id"} string id) returns GroupResource|error {
        json|error response = self.clientEndpoint->get("/Groups/" + id, self.headers, json);
        if (response is json) {
            GroupResource group = check response.cloneWithType(GroupResource);
            return group;
        } else {
            return response;
        }
    }

    # Creates a group.
    #
    # + data - The group data
    # + return - The created group
    @display {label: "Create Group"}
    public isolated function createGroup(@display {label: "Group Data"} SCIMGroup data) returns GroupResource|error {
        json|error response = self.clientEndpoint->post("/Groups", data, self.headers, (), json);
        if (response is json) {
            GroupResource group = check response.cloneWithType(GroupResource);
            return group;
        } else {
            return response;
        }
    }

    # Updates a group.
    #
    # + id - The ID of the group
    # + data - The group data to be updated
    # + return - The updated group
    @display {label: "Update Group"}
    public isolated function updateGroup(@display {label: "Group Id"} string id, @display {label: "Updated data"} GroupUpdate data) returns GroupResource|error {
        json|error response = self.clientEndpoint->put("/Groups/" + id, data, self.headers, (), json);
        if (response is json) {
            GroupResource group = check response.cloneWithType(GroupResource);
            return group;
        } else {
            return response;
        }
    }

    # Deletes a group.
    #
    # + id - The ID of the group
    # + return - The response
    @display {label: "Delete Group"}
    public isolated function deleteGroup(@display {label: "Group Id"} string id) returns json|error {
        json|error response = self.clientEndpoint->delete("/Groups/" + id, (), self.headers, (), json);
        return response;
    }

    # Patches a group.
    #
    # + id - The ID of the group
    # + data - The group data to be patched
    # + return - The patched group
    @display {label: "Patch Group"}
    public isolated function patchGroup(@display {label: "Group Id"} string id, @display {label: "Patch data"} GroupPatch data) returns GroupResponse|error {
        json|error response = self.clientEndpoint->patch("/Groups/" + id, data, self.headers, (), json);
        if (response is json) {
            GroupResponse group = check response.cloneWithType(GroupResponse);
            return group;
        } else {
            return response;
        }
    }

    # Searches for a group.
    #
    # + data - The search data
    # + return - The list of groups
    @display {label: "Search Group"}
    public isolated function searchGroup(@display {label: "Search data"} GroupSearch data) returns GroupResponse|error {
        json|error response = self.clientEndpoint->post("/Groups/.search", data, self.headers, (), json);
        if (response is json) {
            GroupResponse groups = check response.cloneWithType(GroupResponse);
            return groups;
        } else {
            return response;
        }
    }

    # Gets the list of service providers.
    #
    # + data - The data for bulk operation
    # + return - The response of the operation
    @display {label: "Bulk Operation"}
    public isolated function bulk(@display {label: "Bulk operation data"} Bulk data) returns BulkResponse|error {
        json|error response = self.clientEndpoint->post("/Bulk", data, self.headers, (), json);
        if (response is json) {
            BulkResponse user = check response.cloneWithType(BulkResponse);
            return user;
        } else {
            return response;
        }

    }

}

