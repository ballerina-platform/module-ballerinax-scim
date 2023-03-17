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

# + failOnErrors - No. of errors to fail the bulk request
# + schemas - URIs of the SCIM schemas used in the request  
# + Operations - List of operations
public type Bulk record {
    int failOnErrors?;
    string[] schemas;
    Operation[] Operations;
};

# + method - method of the operation  
# + path - path of the operation 
# + bulkId - bulkId of the operation 
# + data - data of the operation
public type Operation record {
    string method;
    string path;
    string bulkId?;
    SCIMUser|BulkUserUpdate|BulkUserReplace|SCIMGroup|BulkGroupUpdate|BulkGroupReplace data?;
};

# + schemas - URIs of the SCIM schemas used
# + username - username of the user 
# + name - name of the user
public type BulkUserReplace record {
    string[] schemas;
    string username;
    Name name;
};

# + op - operation to be performed  
# + path - path of the existing users
# + value - value to be updated
public type BulkUserUpdate record {
    string op;
    string path;
    string value;
};

# + displayName - display name of the group  
# + members - members of the group
public type BulkGroupReplace record {
    string displayName;
    MemberReplace[] members;
};

# + value - id of the member
# + display - username of the member
public type MemberReplace record {
    string value;
    string display;
};

# + op - operation to be performed  
# + path - path of the existing user group  
# + value - value to be updated
public type BulkGroupUpdate record {
    string op;
    string path;
    json[] value;
};

# + method - method of the operation  
# + location - location stored 
# + bulkId - bulkId of the operation  
# + status - http status code of the operation
# + detail - details of the operation  
# + response - response of the operation
public type OperationResponse record {
    string method;
    string location?;
    string bulkId;
    Status status;
    string detail?;
    OpResponse|string response?;
};

# + code - http status code of the operation
public type Status record {
    int code;
};

# + schemas - URIs of the SCIM schemas used
public type OpResponse record {
    string[] schemas;
};

# + schemas - URIs of the SCIM schemas used
# + Operations - List of operations
public type BulkResponse record {
    string[] schemas;
    OperationResponse[] Operations;
};
