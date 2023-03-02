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
    Photo[] photos?;
    string userType?;
    string title?;
    string preferredLanguage?; 
    string locale?;
    string timezone?; 
    boolean active?;
    string password?;
    Group[] groups?;
    Certificate[] x509Certificates?;
    Meta meta?;
    
    };


public type SCIMEnterpriseUser record {
    string employeeNumber?;
    int costCenter?;
    string organization?;
    string division?;
    string department?;
    json manager?;

};

public type Email record {
    string value?;
    string _type?;
    boolean primary?;
};

public type Address record {
    string _type;
    string streetAddress;
    string locality;
    string region;
    int postalCode;
    string country;
    string formatted;
    boolean primary ?;
};

public type Phone record {
    string value;
    string _type;
};

public type Ims record {
    string value;
    string _type;
};

public type Photo record {
    string value;
    string _type;
};

public type Group record {
    string value;
    string display;
    string _ref;
};

public type Certificate record {
    string value;   
};

public type Response record {
    int totalResults;
    int startIndex;
    int itemsPerPage;
    string[] schemas;
    Resource[] Resources;
    
};

public type Resource record {
    string[] emails?;
    string[] schemas?;
    Meta meta;
    Role[] roles;
    Name name?;
    string id;
    string userName;
    Schema schema?;
    SCIMEnterpriseUser enterprise?;
    string password?;
    string scimType?;

};


public type Role record {
    string display;
    string value?;
    string ref?;
    string resourceType?;
};

public type Meta record {
    string created;
    string location;
    string lastModified;
    string resourceType;
    string _version?;

};

public type Name record {
    string formatted?;
    string givenName?;
    string familyName?;
    string middleName?;
    string honorificPrefix?;
    string honorificSuffix?;
};

public type Schema record {
    string idpType;
    boolean isReadOnlyUser;
    string userSource ?;
    string photoUrl ?;
    string userAccountType?;
    
};

public type Operation record {
    string method;
    string path;
    string bulkId;
    SCIMUser data;
    
};

public type Bulk record {
    int failOnErrors?;
    string[] schemas;
    Operation[] Operations;
    
};

public type OperationResponse record {
    string method;
    string location?;
    string bulkId;
    json status;
    string detail?;
    json response?;
    
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

    public isolated function getUsers() returns Response|error {
        json|error response =  self.clientEndpoint->get("/Users", self.headers, json);
        if (response is json) {
            Response user = check response.cloneWithType(Response);
            return user;
        } else {
            return response;
        }
    }

    public isolated function getUser(string id) returns Resource|error {
        json|error response =  self.clientEndpoint->get("/Users/" + id, self.headers, json);
        if (response is json) {
            Resource user = check response.cloneWithType(Resource);
            return user;
        } else {
            return response;
        }
    }

    public isolated function createUser(SCIMUser data) returns Resource|error {
        json|error response =  self.clientEndpoint->post("/Users", data, self.headers, (), json);
        if (response is json) {
            Resource user = check response.cloneWithType(Resource);
            return user;
        } else {
            return response;
        }
    }

    public isolated function updateUser(string id, SCIMUser data) returns Resource|error {
        json|error response =  self.clientEndpoint->put("/Users/" + id, data ,self.headers, (), json);
        if (response is json) {
            Resource user = check response.cloneWithType(Resource);
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
    
    public isolated function patchUser(string id, SCIMUser data) returns Resource|error {
        json|error response =  self.clientEndpoint->patch("/Users/" + id, data , self.headers, (), json);
        if (response is json) {
            Resource user = check response.cloneWithType(Resource);
            return user;
        } else {
            return response;
        }
    }
    


    public isolated function bulkUser(Bulk data) returns BulkResponse|error {
        json|error response =  self.clientEndpoint->post("/Bulk", data, self.headers, (), json);
        if (response is json) {
            BulkResponse user = check response.cloneWithType(BulkResponse);
            return user;
        } else {
            return response;
        }
    
    }
   

}

