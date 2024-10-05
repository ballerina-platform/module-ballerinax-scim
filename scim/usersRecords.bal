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

# Represents the SCIM USER schema.
#
# + schemas - URIs of the used SCIM schemas  
# + externalId - Identifier by the provisioning client  
# + userName - Unique identifier within the system  
# + name - Components of the user's name  
# + displayName - Name displayed to end-users  
# + nickName - Casual name of the user  
# + profileUrl - URI of the user's online profile  
# + emails - Email addresses for the User  
# + addresses - Physical mailing address for the user  
# + phoneNumbers - Phone numbers for the user  
# + entitlements - Entitlements for the User that represent a thing the User has  
# + ims - Instant messaging addresses for the user  
# + roles - List of roles for the user  
# + photos - URI of image of the user  
# + userType - Relationship between the organization and the user  
# + title - Title of the user  
# + preferredLanguage - Preferred written or spoken languages of the user  
# + locale - Default location of the user  
# + timezone - Time zone of the user  
# + active - Administrative status of the user  
# + password - Password of the user  
# + groups - Groups to which the user belongs  
# + x509Certificates - Certificates associated with the user  
# + meta - Metadata of the user  
# + urn\:ietf\:params\:scim\:schemas\:extension\:enterprise\:2\.0\:User - Attributes belong to business or enterprise extension schema  
# + urn\:scim\:wso2\:schema - Attributes belong to WSO2 custom extension schema
public type SCIMUser record {
    string[] schemas?;
    string externalId?;
    string userName?;
    Name name?;
    string displayName?;
    string nickName?;
    string profileUrl?;
    Email[] emails?;
    Address[] addresses?;
    Phone[] phoneNumbers?;
    Entitlement[] entitlements?;
    Ims[] ims?;
    Role[] roles?;
    Photo[] photos?;
    string userType?;
    string title?;
    string preferredLanguage?;
    string locale?;
    string timezone?;
    boolean active?;
    string password?;
    Groups[] groups?;
    Certificate[] x509Certificates?;
    Meta meta?;
    SCIMEnterpriseUser urn\:ietf\:params\:scim\:schemas\:extension\:enterprise\:2\.0\:User?;
    json urn\:scim\:wso2\:schema?;
};

# Represents the SCIM User resource request body used for createUser.
#
# + schemas - URIs of the used SCIM schemas  
# + externalId - Identifier by the provisioning client  
# + userName - Unique identifier within the system  
# + name - Components of the user's name  
# + displayName - Name displayed to end-users  
# + nickName - Casual name of the user  
# + profileUrl - URI of the user's online profile  
# + emails - Email addresses for the User  
# + addresses - Physical mailing address for the user  
# + phoneNumbers - Phone numbers for the user  
# + ims - Instant messaging address for the user  
# + roles - List of roles for the user  
# + photos - URI of image of the user  
# + entitlements - Entitlements for the User that represent a thing the User has  
# + userType - Relationship between the organization and the user  
# + title - Title of the user  
# + preferredLanguage - Preferred written or spoken languages of the user  
# + locale - Default location of the user  
# + timezone - Time zone of the user  
# + active - Administrative status of the user  
# + password - Password of the user  
# + groups - Groups to which the user belongs  
# + x509Certificates - Certificates associated with the user  
# + meta - Metadata of the user  
# + urn\:ietf\:params\:scim\:schemas\:extension\:enterprise\:2\.0\:User - Attributes belong to business or enterprise extension schema  
# + urn\:scim\:wso2\:schema - Attributes belong to WSO2 extension schema
public type UserCreate record {
    string[]|string schemas?;
    string externalId?;
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
    Entitlement[] entitlements?;
    string userType?;
    string title?;
    string preferredLanguage?;
    string locale?;
    string timezone?;
    boolean active?;
    string password;
    Groups[] groups?;
    Certificate[] x509Certificates?;
    Meta meta?;
    SCIMEnterpriseUser urn\:ietf\:params\:scim\:schemas\:extension\:enterprise\:2\.0\:User?;
    json urn\:scim\:wso2\:schema?;
};

# Represents the SCIM Enterprise User extensioon resource.
#
# + employeeNumber - Identifier in association with the organization.  
# + costCenter - Name of a cost center  
# + organization - Name of an organization  
# + division - Name of a division  
# + department - Name of a department  
# + manager - Manager of the user  
public type SCIMEnterpriseUser record {
    string employeeNumber?;
    string costCenter?;
    string organization?;
    string division?;
    string department?;
    Manager manager?;
};

# Represents the sub-attributes of the manager attribute in the SCIMEnterpriseUser record.
#
# + value - Id of the SCIM resource representing the manager of the user
# + displayName - DisplayName of the manager of the user  
# + \$ref - Reference URI 
public type Manager record {
    string value?;
    string displayName?;
    string \$ref?;
};

# Represents the sub-attributes of the emails complex attribute in SCIMUser record.
#
# + value - Canonicalized representation of the email value  
# + display - Name primarily used for display purposes
# + 'type - Type of the email
# + primary - Whether the primary email address
public type Email record {
    string value?;
    string display?;
    emailType 'type?;
    boolean primary?;
};

# Represents the sub-attributes of the addresses complex attribute in SCIMUser record.
#
# + 'type - Type of the address  
# + streetAddress - Street address component
# + locality - City or locality component  
# + region - State or region component  
# + postalCode - Zip code or postal code component  
# + country - Country name component  
# + formatted - Full mailing address  
# + primary - Whether the primary address
public type Address record {
    addressType 'type?;
    string streetAddress?;
    string locality?;
    string region?;
    string postalCode?;
    string country?;
    string formatted?;
    boolean primary?;
};

# Represents the sub-attributes of the phoneNumbers complex attribute in SCIMUser record.
#
# + value - Phonenumber in accordance with the format defined  
# + 'type - Type of the phone number  
# + display - Name used for display purposes  
# + primary - Whether the primary phone number
public type Phone record {
    string value?;
    phoneType 'type?;
    string display?;
    boolean primary?;
};

# Represents the sub-attributes of the ims complex attribute in SCIMUser record.
#
# + value - Instant messaging address  
# + 'type - Type of the IM address
# + display - Name primarily used for display purposes  
# + primary - Whether the primary IM address
public type Ims record {
    string value?;
    imsType 'type?;
    string display?;
    boolean primary?;
};

# Represents the sub-attributes of the photos complex attribute in SCIMUser record.
#
# + value - URI of the photo  
# + 'type - Type of the photo 
# + display - Name primarily used for display purposes
# + primary - Whether the primary photo
public type Photo record {
    string value?;
    photoType 'type?;
    string display?;
    boolean primary?;
};

# Represents the sub-attributes of the groups complex attribute in SCIMUser record.
#
# + value - Id of the group  
# + display - Name of the group  
# + \$ref - Reference URI  
# + 'type - Type of the group
public type Groups record {
    string value?;
    string display?;
    string \$ref?;
    groupType 'type?;
};

# Represents the sub-attributes of the entitlements complex attribute in SCIMUser record.
#
# + value - The value of an entitlement  
# + display - The display name of the entitlement  
# + primary - Whether the entitlement is the primary one 
# + 'type - The type of the entitlement
public type Entitlement record {
    string value?;
    string display?;
    string primary?;
    string 'type?;
};

# Represents the sub-attributes of the certificates complex attribute in SCIMUser record.
#
# + value - DER-encoded X.509 certificate  
# + display - Display name of the certificate  
# + 'type - Type of the certificate
# + primary - Whether the certificate is the primary one
public type Certificate record {
    string value?;
    string display?;
    string 'type?;
    boolean primary?;
};

# Represents the response of the getUsers and searchUser operations.
#
# + totalResults - Total number of results  
# + startIndex - Starting index of the returned results
# + itemsPerPage - Number of results returned per page  
# + schemas - URIs of the used SCIM schemas  
# + Resources - List of returned users
public type UserResponse record {
    int totalResults?;
    int startIndex?;
    int itemsPerPage?;
    string[] schemas?;
    UserResource[] Resources?;
};

# Represents the error response
#
# + detail - Detailed error description  
# + status - HTTP status code 
# + schemas - URIs of the used SCIM schemas  
# + scimType - SCIM type
public type ErrorResponseDetails record {
    string detail;
    string status;
    string[] schemas;
    string scimType?;
};

public type ErrorResponse distinct error<ErrorResponseDetails>;

# Represents the response of the createUser and getUser operations.
#
# + schemas - URIs of the used SCIM schemas  
# + id - Unique identifier by service provider  
# + externalId - Identifier by the provisioning client  
# + userName - Unique identifier for the user  
# + name - Name of the user  
# + displayName - Name displayed to end-users  
# + nickName - Casual name of the user  
# + profileUrl - URI of the user's online profile  
# + emails - Email addresses for the User  
# + addresses - Physical mailing address for the user  
# + phoneNumbers - Phone numbers for the user  
# + photos - URI of image of the user  
# + entitlements - List of entitlements for the user  
# + locale - Default location of the user  
# + active - Administrative status of the user  
# + meta - Metadata of the user  
# + urn\:ietf\:params\:scim\:schemas\:extension\:enterprise\:2\.0\:User - Attributes belong to business or enterprise extension schema  
# + urn\:scim\:wso2\:schema - Attributes belong to WSO2 custom extension schema  
# + roles - List of roles for the user
public type UserResource record {
    string[]|string schemas?;
    string id?;
    string externalId?;
    string userName?;
    Name name?;
    string displayName?;
    string nickName?;
    string profileUrl?;
    string[] emails?;
    Address[] addresses?;
    Phone[] phoneNumbers?;
    Photo[] photos?;
    Entitlement[] entitlements?;
    string locale?;
    boolean active?;
    Meta meta?;
    SCIMEnterpriseUser urn\:ietf\:params\:scim\:schemas\:extension\:enterprise\:2\.0\:User?;
    json urn\:scim\:wso2\:schema?;
    Role[] roles?;
};

# Represents the sub-attributes of the name complex attribute in SCIMUser record.
#
# + formatted - Full name, including all middle names, titles, and suffixes as appropriate, formatted for display  
# + givenName - Given name of the User  
# + familyName - Family name of the User  
# + middleName - Middle name(s) of the User 
# + honorificPrefix - Title 
# + honorificSuffix - Suffix
public type Name record {
    string formatted?;
    string givenName?;
    string familyName?;
    string middleName?;
    string honorificPrefix?;
    string honorificSuffix?;
};

# Represents the request of updateUser operation.
#
# + schemas - URIs of the used SCIM schemas  
# + externalId - Identifier by the provisioning client  
# + userName - Unique identifier within the system  
# + name - Components of the user's name  
# + displayName - Name displayed to end-users  
# + nickName - Casual name of the user  
# + profileUrl - URI of the user's online profile  
# + emails - Email addresses for the User  
# + addresses - Physical mailing address for the user  
# + phoneNumbers - Phone numbers for the user  
# + ims - Instant messaging addresses for the user  
# + roles - List of roles for the user  
# + photos - URI of image of the user  
# + entitlements - List of entitlements for the user
# + userType - Relationship between the organization and the user  
# + title - Title of the user  
# + preferredLanguage - Preferred written or spoken languages of the user  
# + locale - Default location of the user  
# + timezone - Time zone of the user  
# + active - Administrative status of the user  
# + x509Certificates - Certificates associated with the user  
# + meta - Metadata of the user  
# + urn\:ietf\:params\:scim\:schemas\:extension\:enterprise\:2\.0\:User - Attributes belong to business or enterprise extension schema
public type UserUpdate record {
    string[]|string schemas?;
    string externalId?;
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
    Entitlement[] entitlements?;
    string userType?;
    string title?;
    string preferredLanguage?;
    string locale?;
    string timezone?;
    boolean active?;
    Certificate[] x509Certificates?;
    Meta meta?;
    SCIMEnterpriseUser urn\:ietf\:params\:scim\:schemas\:extension\:enterprise\:2\.0\:User?;
};

# Represents the sub-attributes of the operations in userPatch record.
#
# + op - Operation to be performed  
# + path - Target of the operation
# + value - Values to be used for the operation
public type PatchOperations record {
    opType op;
    string path?;
    UserUpdate value?;
};

# Represents the request body of userPatch operation.
#
# + schemas - URIs of the used SCIM schemas  
# + Operations - List of operations to be performed
public type UserPatch record {
    string[] schemas = ["urn:ietf:params:scim:api:messages:2.0:PatchOp"];
    PatchOperations[] Operations;
};

# Represents the request body of userSearch operation.
#
# + schemas - URIs of the used SCIM schemas  
# + attributes - List of attributes to search for  
# + excludedAttributes - Names of resource attributes to be removed from the default set of attributes to return
# + filter - Filter expression  
# + domain - Domain name  
# + startIndex - Starting index of the result set  
# + count - Number of results returned  
# + sortBy - Attribute used to order the returned responses  
# + sortOrder - order in which the sortBy parameter is applied
public type UserSearch record {
    string[] schemas = ["urn:ietf:params:scim:api:messages:2.0:SearchRequest"];
    string[] attributes?;
    string[] excludedAttributes?;
    string filter?;
    string domain?;
    int startIndex?;
    int count?;
    string sortBy?;
    string sortOrder?;
};