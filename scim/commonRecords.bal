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

# Represents the sub-attributes of the meta complex attribute in SCIMUser record.
#
# + created - DateTime that the resource was added 
# + location - URI of the resource being returned 
# + lastModified - Most recent DateTime that the details of this resource were updated  
# + resourceType - Name of the resource type of the resource  
# + 'version - Version of the resource being returned
public type Meta record {
    string created;
    string location;
    string lastModified;
    string resourceType?;
    string 'version?;
};

# Represents the sub-attributes of the roles complex attribute in SCIMUser record.
#
# + display - Human readable name, primarily used for display purposes  
# + value - Label representing a collection of entitlements  
# + primary - Whether the role is the primary role for the user 
# + \$ref - Reference URI  
# + resourceType - Resource type of the entitlement
public type Role record {
    string display?;
    string value?;
    boolean primary?;
    string \$ref?;
    string resourceType?;
};