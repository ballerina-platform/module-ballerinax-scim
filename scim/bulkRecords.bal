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

# Represents the SCIM Bulk resource schema
#
# + failOnErrors - Number of errors that the service provider will accept before the operation is terminated and an error response is returned
# + schemas - URIs of the SCIM schemas used in the request  
# + Operations - List of operations within the bulk
public type Bulk record {
    int failOnErrors?;
    string[] schemas;
    Operation[] Operations;
};

# Represents the sub-attributes of the Operations attribute of the Bulk resource schema
#
# + method - HTTP method of the current operation ["POST", "PUT", "PATCH", or "DELETE"]
# + path - Path of the operation 
# + bulkId - BulkId of the operation 
# + data - Data of the operation
# + version - Current resource version
public type Operation record {
    string method;
    string path;
    string bulkId?;
    string 'version?;
    SCIMUser|BulkUserUpdate|BulkUserReplace|SCIMGroup|BulkGroupUpdate|BulkGroupReplace data?;
};

# Represents the BulkUserReplace reponse's data field attributes under the Operation record
#
# + schemas - URIs of the SCIM schemas used
# + username - Username of the user 
# + name - Name of the user
public type BulkUserReplace record {
    string[] schemas;
    string username;
    Name name;
};

# Represents the BulkUserUpdate reponse's data field attributes under the Operation record
#
# + op - Operation to be performed  
# + path - Path of the existing users
# + value - Value to be updated
public type BulkUserUpdate record {
    string op;
    string path;
    string value;
};

# Represents the BulkGroupReplace reponse's data field attributes under the Operation record
#
# + displayName - Display name of the group  
# + members - Members of the group
public type BulkGroupReplace record {
    string displayName;
    MemberReplace[] members;
};

# Represents the sub-attributes of the members attribute of the BulkGroupReplace record
#
# + value - Id of the member
# + display - Username of the member
public type MemberReplace record {
    string value;
    string display;
};

# Represents the BulkGroupUpdate reponse's data field attributes under the Operation record
#
# + op - Operation to be performed  
# + path - Path of the existing user group  
# + value - Value to be updated
public type BulkGroupUpdate record {
    string op;
    string path;
    json[] value;
};

# Represents the sub-attributes of the status attribute of the OperationResponse record
#
# + code - Http status code of the operation
public type Status record {
    int code;
};

# Represents the sub-attributes of the response of the OperationResponse record
#
# + schemas - URIs of the SCIM schemas used
public type OpResponse record {
    string[] schemas;
};

# Represents the response of the Bulk operations
#
# + schemas - URIs of the SCIM schemas used
# + Operations - List of operations
public type BulkResponse record {
    string[] schemas;
    OperationResponse[] Operations;
};

# Represents the sub-attributes of the Operations attribute of the BulkResponse record
#
# + method - Method of the operation  
# + location - Location stored 
# + bulkId - BulkId of the operation  
# + status - Http status code of the operation
# + detail - Details of the operation  
# + response - Response of the operation
public type OperationResponse record {
    string method;
    string location?;
    string bulkId;
    Status status;
    string detail?;
    OpResponse|string response?;
};
