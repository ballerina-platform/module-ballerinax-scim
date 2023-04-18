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

# Represents the SCIM Group schema
#
# + schemas - The list of schema URIs used
# + displayName - Name for the Group
# + members - List of members of the Group 
# + meta - Metadata of the group  
# + roles - List of roles for the group
# + externalId - Identifier by the provisioning client  
public type SCIMGroup record {
    string[] schemas?;
    string displayName;
    Member[] members?;
    Meta meta?;
    Role roles?;
    string externalId?;
};

# Represents the SCIM Group resource request body used for createGroup
#
# + schemas - URIs of the used SCIM schemas  
# + displayName - Name for the Group  
# + members - List of members of the Group  
# + meta - Metadata of the group  
# + roles - List of roles for the group
# + externalId - Identifier by the provisioning client  
public type GroupCreate record {
    string[] schemas;
    string displayName;
    Member[] members?;
    Meta meta?;
    Role roles?;
    string externalId?;
};

# Represents the sub-attributes of members attribute of SCIM Group resource schema
#
# + value - Value of an "id" attribute of a SCIM resource  
# + display - Name used to display  
# + \$ref - Reference URI  
# + 'type - Type of the member
public type Member record {
    string value?;
    string display?;
    string \$ref?;
    memberType 'type?;
};

# Represents the response of by getGroups and searchGroup methods
#
# + totalResults - Total number of results  
# + startIndex - Starting index of the returned results  
# + itemsPerPage - Number of results returned per page  
# + schemas - The list of schema URIs used  
# + Resources - The list of group resources
public type GroupResponse record {
    int totalResults?;
    int startIndex?;
    int itemsPerPage?;
    string[] schemas?;
    GroupResource[] Resources?;
};

# Represents the Response of createGroup and getGroup methods
#
# + displayName - Name for the Group  
# + meta - Metadata of the group
# + members - List of members of the Group 
# + roles - List of roles for the group 
# + id - Unique identifier by service provider
# + schemas - The list of schema URIs used
# + externalId - Identifier by the provisioning client  
public type GroupResource record {
    string displayName?;
    Meta meta;
    Member[] members?;
    Role[] roles?;
    string id?;
    string[] schemas?;
    string externalId?;
};

# Represents the Response of updateGroup method
#
# + schemas - The list of schema URIs used
# + displayName - Name for the Group
# + members - List of members of the Group 
# + meta - Metadata of the group  
# + roles - List of roles for the group
# + externalId - Identifier by the provisioning client  
public type GroupUpdate record {
    string[] schemas?;
    string displayName?;
    Member[] members?;
    Meta meta?;
    Role roles?;
    string externalId?;
};

# Represents the Request body of patchGroup method
#
# + schemas - URIs of the used SCIM schemas  
# + Operations - List of operations
public type GroupPatch record {
    string[] schemas;
    PatchOpGroup[] Operations;
};

# Represents the sub-attributes of Operations attribute of GroupPatch record
#
# + op - Operation to be performed  
# + path - Target of the operation
# + value - Value to be used for the operation
public type PatchOpGroup record {
    opType op;
    string path?;
    GroupUpdate value;
};

# Represents the Request body of searchGroup method
#
# + attributes - Names of resource attributes to return  
# + excludedAttributes - Names of resource attributes to be removed from the default set of attributes to return  
# + sortBy - Attribute used to order the returned responses  
# + sortOrder - order in which the sortBy parameter is applied  
# + schemas - URIs of the used SCIM schemas  
# + filter - Filter expression  
# + startIndex - Starting index of the first query results  
# + count - Maximum number of query results per page  
# + domain - Domain name
public type GroupSearch record {
    string[] attributes?;
    string[] excludedAttributes?;
    string sortBy?;
    string sortOrder?;
    string[] schemas;
    string filter?;
    int startIndex?;
    int count?;
    string domain?;
};
