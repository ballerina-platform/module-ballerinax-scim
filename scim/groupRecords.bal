// Copyright (c) 2022, WSO2 LLC. (http://www.wso2.com).

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

# + id - unique identifier by service provider  
# + schemas - URIs of the used SCIM schemas  
# + displayName - name for the Group  
# + members - list of members of the Group  
# + meta - metadata of the group  
# + roles - list of roles for the group
public type SCIMGroup record {
    string id?;
    string[] schemas;
    string displayName;
    Member[] members?;
    Meta meta?;
    Role roles?;
};

# + value - value of an "id" attribute of a SCIM resource  
# + display - name used to display 
# + \$ref - reference URI
public type Member record {
    string value?;
    string display?;
    string \$ref?;
};

# + totalResults - total number of results  
# + startIndex - starting index of the returned results  
# + itemsPerPage - number of results returned per page  
# + schemas - the list of schema URIs used  
# + Resources - the list of group resources
public type GroupResponse record {
    int totalResults?;
    int startIndex?;
    int itemsPerPage?;
    string[] schemas?;
    GroupResource[] Resources?;
};

# + displayName - name for the Group  
# + meta - metadata of the group
# + members - list of members of the Group 
# + roles - list of roles for the group 
# + id - unique identifier by service provider
public type GroupResource record {
    string displayName?;
    Meta meta;
    Member[] members?;
    Role[] roles?;
    string id?;

};

# + displayName - name for the Group
# + members - list of members of the Group 
# + meta - metadata of the group  
# + roles - list of roles for the group
public type GroupUpdate record {
    string displayName;
    Member[] members?;
    Meta meta?;
    Role roles?;
};

# + schemas - URIs of the used SCIM schemas  
# + Operations - list of operations
public type GroupPatch record {
    string[] schemas;
    PatchOpGroup[] Operations;
};

# + op - operation to be performed 
# + value - value to be used for the operation
public type PatchOpGroup record {
    string op;
    ValueGroup value;
};

# + members - list of members of the Group
# + meta - metadata of the group 
# + roles - list of roles for the group
public type ValueGroup record {
    Member[] members?;
    Meta meta?;
    Role roles?;
};

# + schemas - URIs of the used SCIM schemas  
# + filter - filter expression 
# + startIndex - starting index of the returned results
public type GroupSearch record {
    string[] schemas;
    string filter;
    int startIndex?;
};

