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
# + bulkId - BulkId of the operation (required when the method is "POST" )
# + version - Current resource version (used when method is "PUT", "PATCH", or "DELETE")
# + data - Data of the operation (not an attribute when method is "DELETE")
# - method "POST" --->  SCIMUser/SCIMGroup
# - method "PUT" --->  UserUpdate/GroupUpdate
# - method "PATCH" --->  BulkPatch 
# - method "DELETE" --->  (No data attribute)         
public type Operation record {
    string method;
    string path;
    string bulkId?;
    string 'version?;
    SCIMUser|SCIMGroup|BulkPatch data?;
};

# Represents the Bulk request body, data attibute of PATCH method
#
# + Operations - List of operations within the bulk patch request
public type BulkPatch record {
    BulkPatchOperation[] Operations;
};

# Represents the Bulk request's data field attributes under the Operation record
#
# + op - Operation to be performed  
# + path - Path of the existing users/groups
# + value - Value to be updated
public type BulkPatchOperation record {
    string op;
    string path?;
    json|string|boolean|decimal|int value?;
};

# Represents the response of the Bulk operations
#
# + schemas - URIs of the SCIM schemas used
# + Operations - List of operations
public type BulkResponse record {
    string[] schemas;
    BulkResponseOperation[] Operations;
};

# Represents the sub-attributes of the Operations attribute of the BulkResponse record
#
# + method - Method of the operation  
# + location - Resource endpoint URL  
# + bulkId - BulkId of the operation (Found in the response only when the method is "POST")  
# + status - Http status code of the operation 
# + 'version - Current resource version (Found in the response only when the method is "POST", "PUT" and "PATCH")
public type BulkResponseOperation record {
    string method;
    string location?;
    string bulkId?;
    Status status;
    string 'version?;

};

# Represents the sub-attributes of the status attribute of the OperationResponse record
#
# + code - Http status code of the operation
public type Status record {
    int code;
};

