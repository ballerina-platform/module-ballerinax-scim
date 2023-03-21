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

# + schemas - URIs of the used SCIM schemas  
# + id - unique identifier by service provider  
# + externalId - identifier by the provisioning client  
# + userName - unique identifier within the system  
# + name - components of the user's name  
# + displayName - name displayed to end-users  
# + nickName - casual name of the user 
# + profileUrl - URI of the user's online profile  
# + emails - email addresses for the User 
# + addresses - physical mailing address for the user  
# + phoneNumbers - phone numbers for the user  
# + ims - instant messaging address for the user  
# + roles - list of roles for the user  
# + photos - URI of image of the user  
# + userType - relationship between the organization and the user  
# + title - title of the user
# + preferredLanguage - preferred written or spoken languages of the user
# + locale - default location of the user
# + timezone - time zone of the user
# + active - administrative status of the user 
# + password - password of the user
# + groups - groups to which the user belongs  
# + x509Certificates - certificates associated with the user 
# + meta - metadata of the user  
# + urn\:ietf\:params\:scim\:schemas\:extension\:enterprise\:2\.0\:User - attributes belong to business or enterprise extension schema
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

# + employeeNumber - identifier in association with the organization.  
# + costCenter - name of a cost center  
# + organization - name of an organization  
# + division - name of a division  
# + department - name of a department  
# + manager - manager of the user  
# + verifyEmail - email address has been verified or not
public type SCIMEnterpriseUser record {
    string employeeNumber?;
    int costCenter?;
    string organization?;
    string division?;
    string department?;
    Manager manager?;
    boolean verifyEmail?;
};

# + value - id of the SCIM resource representing the manager of the user
# + displayName - displayName of the manager of the user  
# + \$ref - reference URI 
public type Manager record {
    string value?;
    string displayName?;
    string \$ref?;
};

# + value - canonicalized representation of the email value  
# + 'type - email classification  
# + primary - whether the primary email address
public type Email record {
    string value?;
    string 'type?;
    boolean primary?;
};

# + 'type - type of the address  
# + streetAddress - street address component
# + locality - city or locality component  
# + region - state or region component  
# + postalCode - zip code or postal code component  
# + country - country name component  
# + formatted - full mailing address  
# + primary - whether the primary address
public type Address record {
    string 'type;
    string streetAddress;
    string locality;
    string region;
    string postalCode;
    string country?;
    string formatted?;
    boolean primary?;
};

# + value - phonenumber in accordance with the format defined  
# + 'type - type of the phonenumber
public type Phone record {
    string value;
    string 'type;
};

# + value - instant messaging address  
# + 'type - type of the instant messaging address
public type Ims record {
    string value;
    string 'type;
};

# + value - URI of the photo
# + 'type - photo size value
public type Photo record {
    string value;
    string 'type;
};

# + value - id of the group  
# + display - name of the group  
# + \$ref - reference URI 
public type Group record {
    string value;
    string display;
    string \$ref;
};

# + value - DER-encoded X.509 certificate
public type Certificate record {
    string value;
};

# + totalResults - total number of results  
# + startIndex - starting index of the returned results
# + itemsPerPage - number of results returned per page  
# + schemas - URIs of the used SCIM schemas  
# + Resources - list of returned users
public type UserResponse record {
    int totalResults?;
    int startIndex?;
    int itemsPerPage?;
    string[] schemas?;
    UserResource[] Resources?;
};

# + detail - detailed error description  
# + status - HTTP status code 
# + schemas - URIs of the used SCIM schemas  
# + scimType - SCIM type
public type ErrorResponse record {
    string detail;
    string status;
    string[] schemas;
    string scimType?;
};

# + schemas - URIs of the used SCIM schemas
# + id - unique identifier by service provider  
# + externalId - identifier by the provisioning client   
# + userName - unique identifier for the user 
# + name - name of the user  
# + displayName - name displayed to end-users
# + nickName - casual name of the user  
# + profileUrl - URI of the user's online profile  
# + emails - email addresses for the User  
# + addresses - physical mailing address for the user  
# + phoneNumbers - phone numbers for the user  
# + photos - URI of image of the user  
# + locale - default location of the user  
# + active - administrative status of the user 
# + meta - metadata of the user 
# + urn\:ietf\:params\:scim\:schemas\:extension\:enterprise\:2\.0\:User - attributes belong to business or enterprise extension schema  
# + urn\:scim\:wso2\:schema - attributes belong to WSO2 custom extension schema  
# + roles - list of roles for the user
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
    Custom urn\:scim\:wso2\:schema?;
    Role[] roles?;
};

# + display - human readable name, primarily used for display purposes
# + value - label representing a collection of entitlements  
# + \$ref - reference URI 
# + resourceType - resource type of the entitlement
public type Role record {
    string display;
    string value?;
    string \$ref?;
    string resourceType?;
};

# + created - DateTime that the resource was added 
# + location - URI of the resource being returned 
# + lastModified - most recent DateTime that the details of this resource were updated  
# + resourceType - name of the resource type of the resource  
# + 'version - version of the resource being returned
public type Meta record {
    string created;
    string location;
    string lastModified;
    string resourceType?;
    string 'version?;
};

# + formatted - full name, including all middle names, titles, and suffixes as appropriate, formatted for display  
# + givenName - given name of the User  
# + familyName - family name of the User  
# + middleName - middle name(s) of the User 
# + honorificPrefix - title 
# + honorificSuffix - suffix
public type Name record {
    string formatted?;
    string givenName?;
    string familyName?;
    string middleName?;
    string honorificPrefix?;
    string honorificSuffix?;
};

# + idpType - identity provider type  
# + isReadOnlyUser - whether the user is read only
# + userSource - source of the user 
# + photoUrl - URI of the user's photo  
# + userAccountType - type of the user account  
# + askPassword - whether the user is asked to provide a password
public type Custom record {
    string idpType;
    boolean|string isReadOnlyUser?;
    string userSource?;
    string photoUrl?;
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

# + op - operation to be performed  
# + value - values to be used for the operation
public type PatchOp record {
    string op;
    Value value;
};

# + schemas - URIs of the used SCIM schemas  
# + Operations - list of operations to be performed
public type UserPatch record {
    string[] schemas;
    PatchOp[] Operations;
};

# + schemas - URIs of the used SCIM schemas  
# + attributes - list of attributes to search for  
# + filter - filter expression  
# + domain - domain name  
# + startIndex - starting index of the result set 
# + count - number of results returned
public type UserSearch record {
    string[] schemas;
    string[] attributes;
    string filter;
    string domain?;
    int startIndex?;
    int count?;
};
