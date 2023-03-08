import ballerina/oauth2;
import ballerina/http;
import ballerina/io;

public type SCIMUser record {
    string[]|string schemas?; 
    string id?; 
    int externalId?;
    string userName?;
    Name name?; 
    string displayName?; 
    string nickName?;
    string profileUrl?;
    Email[] emails?;
    Address[] addresses?;
    Phone[] phoneNumbers?;
    Ims[] ims?;
    Role[] roles?;
    Photo[] photos?;
    string userType?;
    string title?;
    string preferredLanguage?; 
    string locale?;
    string timezone?; 
    boolean active?;
    string password;
    Group[] groups?;
    Certificate[] x509Certificates?;
    Meta meta?;
    SCIMEnterpriseUser urn\:ietf\:params\:scim\:schemas\:extension\:enterprise\:2\.0\:User?;
    };


public type SCIMEnterpriseUser record {
    string employeeNumber?;
    int costCenter?;
    string organization?;
    string division?;
    string department?;
    Manager manager?;
    boolean verifyEmail?;

};

public type SCIMGroup record {
    string id?;
    string[] schemas; 
    string displayName; 
    Member[] members?;
    Meta meta?;
    Role roles?;

};

public type Manager record {
    string value?;
    string displayName?;
    string \$ref?;
};

public type Member record {
    string value?;
    string display?;
    string \$ref?;

};

public type Email record {
    string value?;
    string 'type?;
    boolean primary?;
};

public type Address record {
    string 'type;
    string streetAddress;
    string locality;
    string region;
    string postalCode;
    string country?;
    string formatted?;
    boolean primary ?;
};

public type Phone record {
    string value;
    string 'type;
};

public type Ims record {
    string value;
    string 'type;
};

public type Photo record {
    string value;
    string 'type;
};

public type Group record {
    string value;
    string display;
    string \$ref;
};

public type Certificate record {
    string value;   
};

public type UserResponse record {
    int totalResults?;
    int startIndex?;
    int itemsPerPage?;
    string[] schemas?;
    UserResource[] Resources?;
    
};

public type ErrorResponse record {
    string detail;
    string status;
    string[] schemas;
    string scimType?;
    
};

public type UserResource record {
    string[]|string schemas?; 
    string id?; 
    int|string externalId?;
    string userName?;
    Name name?; 
    string displayName?; 
    string nickName?;
    string profileUrl?;
    string[] emails?;
    Address[] addresses?;
    Phone[] phoneNumbers?;
    Photo[] photos?;
    string locale?; 
    boolean active?;
    Meta meta;
    SCIMEnterpriseUser urn\:ietf\:params\:scim\:schemas\:extension\:enterprise\:2\.0\:User?;
    WSO2 urn\:scim\:wso2\:schema?;
    Role[] roles?;
};


public type Role record {
    string display;
    string value?;
    string \$ref?;
    string resourceType?;
};

public type Meta record {
    string created;
    string location;
    string lastModified;
    string resourceType?;
    string 'version?;
   
};

public type Name record {
    string formatted?;
    string givenName?;
    string familyName?;
    string middleName?;
    string honorificPrefix?;
    string honorificSuffix?;
};

public type WSO2 record {
    string idpType;
    boolean|string isReadOnlyUser?;
    string userSource ?;
    string photoUrl ?;
    string userAccountType?;
    boolean askPassword?;
    
};

public type UserUpdate record {
    string[]|string schemas?; 
    string id?; 
    int externalId?;
    string userName?;
    Name name?; 
    string displayName?; 
    string nickName?;
    string profileUrl?;
    Email[] emails?;
    Address[] addresses?;
    Phone[] phoneNumbers?;
    Ims[] ims?;
    Role[] roles?;
    Photo[] photos?;
    string userType?;
    string title?;
    string preferredLanguage?; 
    string locale?;
    string timezone?; 
    boolean active?;
    Group[] groups?;
    Certificate[] x509Certificates?;
    Meta meta?;
    SCIMEnterpriseUser urn\:ietf\:params\:scim\:schemas\:extension\:enterprise\:2\.0\:User?;
};

public type Value record {
    string[]|string schemas?;  
    int externalId?;
    string userName?;
    Name name?; 
    string displayName?; 
    string nickName?;
    string profileUrl?;
    Email[] emails?;
    Address[] addresses?;
    Phone[] phoneNumbers?;
    Ims[] ims?;
    Role[] roles?;
    Photo[] photos?;
    string userType?;
    string title?;
    string preferredLanguage?; 
    string locale?;
    string timezone?; 
    boolean active?;
    Group[] groups?;
    Certificate[] x509Certificates?;
    Meta meta?;
    SCIMEnterpriseUser urn\:ietf\:params\:scim\:schemas\:extension\:enterprise\:2\.0\:User?;
    
};

public type PatchOp record {
    string op;
    Value value;
    
};

public type UserPatch record {
    string[] schemas;
    PatchOp[] Operations;
    
};

public type UserSearch record {
    string[] schemas;
    string[] attributes;
    string filter;
    string domain?;
    int startIndex?;
    int count?;
    
};

public type GroupResponse record {
    int totalResults?;
    int startIndex?;
    int itemsPerPage?;
    string[] schemas?;
    GroupResource[] Resources?;
    
};

public type GroupResource record {
    string displayName?;
    Meta meta;
    Member[] members?;
    Role[] roles?;
    string id?;
    
};

public type GroupUpdate record {
    string displayName; 
    Member[] members?;
    Meta meta?;
    Role roles?;

};

public type GroupPatch record {
    string[] schemas;
    PatchOpGroup[] Operations;
    
};

public type PatchOpGroup record {
    string op;
    ValueGroup value;
    
};

public type ValueGroup record {
    Member[] members?;
    Meta meta?;
    Role roles?;
    
};

public type GroupSearch record {
    string[] schemas;
    string filter;
    int startIndex?;

};

public type Operation record {
    string method;
    string path;
    string bulkId?;
    SCIMUser|BulkUserUpdate|BulkUserReplace|SCIMGroup|BulkGroupUpdate|BulkGroupReplace data?;
    
};

public type Bulk record {
    int failOnErrors?;
    string[] schemas;
    Operation[] Operations;
    
};

public type BulkUserReplace record {
    string[] schemas;
    string username;
    Name name;
    
};

public type BulkUserUpdate record {
    string op;
    string path;
    string value;
    
};

public type BulkGroupReplace record {
    string displayName;
    MemberReplace[] members;
    
};

public type MemberReplace record {
    string value;
    string display;
    
};

public type BulkGroupUpdate record {
    string op;
    string path;
    json[] value;
    
};

public type OperationResponse record {
    string method;
    string location?;
    string bulkId;
    Status status;
    string detail?;
    OpResponse|string response?;
    
};

public type Status record {
    int code;
    
};

public type OpResponse record {
    string[] schemas; 
    
};

public type BulkResponse record {
    string[] schemas;
    OperationResponse[] Operations;  
    
};


public class Client{

    private final string orgName; 
    private final string clientId;
    private final string clientSecret; 
    private final string[] scope;
    final oauth2:ClientOAuth2Provider provider;
    final http:Client clientEndpoint;
    final map<string> headers;

    public isolated function init(string orgName,string clientId, string clientSecret, string[] scope ) returns error? {
        self.orgName=orgName;
        self.clientId=clientId;
        self.clientSecret=clientSecret;
        self.scope=scope;

        self.provider = new({
        tokenUrl: "https://api.asgardeo.io/t/"+self.orgName+"/oauth2/token",
        clientId: clientId,
        clientSecret: clientSecret,
        scopes:scope
        });

        self.clientEndpoint =check new("https://api.asgardeo.io/t/"+self.orgName+"/scim2",{httpVersion: "1.1"});
        
        string token =  check self.provider.generateToken();
        io:print(token);
        
        self.headers = {
        "accept": "application/scim+json",
        "Authorization": "Bearer " + token};
    }

    public isolated function getUsers() returns UserResponse|error {
        json|error response =  self.clientEndpoint->get("/Users", self.headers, json);
        if (response is json) {
            UserResponse users = check response.cloneWithType(UserResponse);
            return users;
        } else {
            return response;
        }
    }

    public isolated function getUser(string id) returns UserResource|error {
        json|error response =  self.clientEndpoint->get("/Users/" + id, self.headers, json);
        if (response is json) {
            UserResource user = check response.cloneWithType(UserResource);
            return user;
        } else {
            return response;
        }
    }

    public isolated function createUser(SCIMUser data) returns UserResource|error {
        json|error response =  self.clientEndpoint->post("/Users", data, self.headers, (), json);
        if (response is json) {
            UserResource user = check response.cloneWithType(UserResource);
            return user;
        } else {
            return response;
        }
    }

    public isolated function updateUser(string id, UserUpdate data) returns UserResource|error {
        json|error response =  self.clientEndpoint->put("/Users/" + id, data ,self.headers, (), json);
        if (response is json) {
            UserResource user = check response.cloneWithType(UserResource);
            return user;
        } else {
            return response;
        }
    }


    public isolated function deleteUser(string id) returns json|error {
        json|error response =  self.clientEndpoint->delete("/Users/" + id,(), self.headers, (), json);
        // if (response is json) {
        //     Resource user = check response.cloneWithType(Resource);
        //     return user;
        // } else {
            return response;
        // }
    }
    
    public isolated function patchUser(string id, UserPatch data) returns UserResponse|error {
        json|error response =  self.clientEndpoint->patch("/Users/" + id, data , self.headers, (), json);
        if (response is json) {
            UserResponse user = check response.cloneWithType(UserResponse);
            return user;
        } else {
            return response;
        }
    }

    public isolated function searchUser(UserSearch data) returns UserResponse|error {
        json|error response =  self.clientEndpoint->post("/Users/.search", data , self.headers, (), json);
        if (response is json) {
            UserResponse users = check response.cloneWithType(UserResponse);
            return users;
        } else {
            return response;
        }
    }
    
    public isolated function getGroups() returns GroupResponse|error {
        json|error response =  self.clientEndpoint->get("/Groups", self.headers, json);
        if (response is json) {
            GroupResponse groups = check response.cloneWithType(GroupResponse);
            return groups;
        } else {
            return response;
        }
    }

    public isolated function getGroup(string id) returns GroupResource|error {
        json|error response =  self.clientEndpoint->get("/Groups/" + id, self.headers, json);
        if (response is json) {
            GroupResource group = check response.cloneWithType(GroupResource);
            return group;
        } else {
            return response;
        }
    }

    public isolated function createGroup(SCIMGroup data) returns GroupResource|error {
        json|error response =  self.clientEndpoint->post("/Groups", data, self.headers, (), json);
        if (response is json) {
            GroupResource group = check response.cloneWithType(GroupResource);
            return group;
        } else {
            return response;
        }
    }

    public isolated function updateGroup(string id, GroupUpdate data) returns GroupResource|error {
        json|error response =  self.clientEndpoint->put("/Groups/" + id, data ,self.headers, (), json);
        if (response is json) {
           GroupResource group = check response.cloneWithType(GroupResource);
            return group;
        } else {
            return response;
        }
    }


    public isolated function deleteGroup(string id) returns json|error {
        json|error response =  self.clientEndpoint->delete("/Groups/" + id,(), self.headers, (), json);
        // if (response is json) {
        //     Resource user = check response.cloneWithType(Resource);
        //     return user;
        // } else {
            return response;
        // }
    }
    
    public isolated function patchGroup(string id, GroupPatch data) returns GroupResponse|error {
        json|error response =  self.clientEndpoint->patch("/Groups/" + id, data , self.headers, (), json);
        if (response is json) {
            GroupResponse group = check response.cloneWithType(GroupResponse);
            return group;
        } else {
            return response;
        }
    }

    public isolated function searchGroup(GroupSearch data) returns GroupResponse|error {
        json|error response =  self.clientEndpoint->post("/Groups/.search", data , self.headers, (), json);
        if (response is json) {
            GroupResponse groups = check response.cloneWithType(GroupResponse);
            return groups;
        } else {
            return response;
        }
    }


    public isolated function bulk(Bulk data) returns BulkResponse|error {
        json|error response =  self.clientEndpoint->post("/Bulk", data, self.headers, (), json);
        if (response is json) {
            BulkResponse user = check response.cloneWithType(BulkResponse);
            return user;
        } else {
            return response;
        }
    
    }
   

}

