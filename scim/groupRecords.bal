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

# Represents the SCIM Group resource schema
#
# + id - Unique identifier by service provider  
# + schemas - URIs of the used SCIM schemas  
# + displayName - Name for the Group  
# + members - List of members of the Group  
# + meta - Metadata of the group  
# + roles - List of roles for the group
public type SCIMGroup record {
    string id?;
    string[] schemas;
    string displayName;
    Member[] members?;
    Meta meta?;
    Role roles?;
};

# Represents the sub-attributes of members attribute of SCIM Group resource schema 
#
# + value - Value of an "id" attribute of a SCIM resource  
# + display - Name used to display 
# + \$ref - Reference URI
public type Member record {
    string value?;
    string display?;
    string \$ref?;
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
public type GroupResource record {
    string displayName?;
    Meta meta;
    Member[] members?;
    Role[] roles?;
    string id?;

};

# Represents the Response of updateGroup method
#
# + displayName - Name for the Group
# + members - List of members of the Group 
# + meta - Metadata of the group  
# + roles - List of roles for the group
public type GroupUpdate record {
    string displayName;
    Member[] members?;
    Meta meta?;
    Role roles?;
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
# + value - Value to be used for the operation
public type PatchOpGroup record {
    string op;
    ValueGroup value;
};

# Represents the sub-attributes of value attribute of PatchOpGroup record
#
# + members - List of members of the Group
# + meta - Metadata of the group 
# + roles - List of roles for the group
public type ValueGroup record {
    Member[] members?;
    Meta meta?;
    Role roles?;
};

# Represents the Request body of searchGroup method
#
# + schemas - URIs of the used SCIM schemas  
# + filter - Filter expression 
# + startIndex - Starting index of the returned results
public type GroupSearch record {
    string[] schemas;
    string filter;
    int startIndex?;
};
