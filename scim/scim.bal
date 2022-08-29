# + addresses - Address of the user
# + emails - Email Address of the user
# + ims - IM of the user
# + meta - Meta infomation
# + name - User given name and family name
# + password - Password od the User
# + phoneNumbers - User contact numbers
# + profileUrl - URL of the profile
# + schemas - SCIM schemas
# + userName - Username of the user
public type SCIMUser record {
    
    json[] addresses?;
    string[] emails?;
    string[] ims?;
    json meta;
    json name?;
    string password?;
    json[] phoneNumbers?;
    string profileUrl?;
    string[] schemas;
    string userName;
    
};
