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

import ballerina/http;

isolated function getparams(string[] array) returns string {
    string params =
            array.reduce(
                isolated function(string concat, string next) returns string => concat + next + ",",
                initial = ""
            );
    return params;
}

isolated function getErrorResponse(http:ClientError clientError) returns ErrorResponse|error {
    http:Detail errorDetail = check clientError.detail().ensureType();
    string responseBodyString = check errorDetail.body.cloneWithType();
    json responseBody = check responseBodyString.fromJsonString();
    string[] schemas = check (check responseBody.schemas).cloneWithType();
    return error ErrorResponse (
        string `SCIM Error ${clientError.message()}`, 
        detail = check responseBody.detail, 
        status = check responseBody.status, 
        schemas = schemas);
}
