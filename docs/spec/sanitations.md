_Author_:  @niveathika \
_Created_: 05/08/2025 \
_Updated_: 05/08/2025 \
_Edition_: Swan Lake

# Sanitation for OpenAPI specification

This document records the sanitation done on top of the official OpenAPI specification from Ballerina SCIM Library. 
The OpenAPI specification is obtained from [Asgardeo SCIM2 Docs](https://wso2.com/asgardeo/docs/apis/scim2/).
These changes are done in order to improve the overall usability, and as workarounds for some known language limitations.

1. Merge all 5 openapi spec using the `openapi-merge-cli` tool. Config used `openapi-merge.json`.
2. Generalize the descriptions
3. Make the `organisation-name` in the server url use variable with default empty value.
4. Add authentication schemas for `Oauth2` client crednetials grant type.
5. Add title for `urn:ietf:params:scim:schemas:extension:enterprise:2.0:User` property in `UserObject.email` (https://github.com/ballerina-platform/ballerina-library/issues/8144)
6. Fix `components.schemas.UserSearchRequestObject.items` schema

## OpenAPI cli command

The following command was used to generate the Ballerina client from the OpenAPI specification. The command should be executed from the repository root directory.

```bash
bal openapi -i .\docs\spec\openapi.yaml -o .\ballerina\ --license .\docs\license.txt --mode client
```
Note: The license year is hardcoded to 2025, change if necessary.
