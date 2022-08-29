## Overview
The `ballerinax/scim` is a [Ballerina](https://ballerina.io/) package for mapping scim data. This package provides the capability to easily access fields in a scim request(which contains the user details) coming to the API endpoint.

## Quickstart
To use this package in your ballerina application.
Import the package as,

```ballerina
import ballerinax/scim
```
## Bind the payload with the package
To bind http payload with the package, 
```ballerina
(@http:Payload scim:SCIMUser payload)

```
Then you can access the fields in the payload,
```ballerina
String username = payload.username;
String password = payload.password;
```
