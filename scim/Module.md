
# Package overview
This package contains a client connector that can be used for inbound provisioning of users and groups to an Asgardeo Organization through the SCIM2.0 /Users, /Groups and /Bulk endpoints by using SCIM protocol. It also contains a set of SCIM schema records defined following the SCIM specification, that can be used to map SCIM objects and do operations in an easy manner.

## Capabilities

* SCIM schemas defined as Ballerina records
* Provisioning users through Users endpoint
* Provisioning groups through Groups endpoint
* Provisioning users and groups through Bulk endpoint

## Usage

To use this package import the package to a Ballerina program.

```ballerina
import ballerinax/scim;
```
Initialize the connector configuration record.

```ballerina
scim:ConnectorConfig config = {
    orgName: "<orgName>",
    clientId: "<clientId>",
    clientSecret : "<clientSecret>",
    scope : ["<scope1>", "<scope2>"]
};
```

Initialize the connector.

```ballerina
scim:Client client1 = check new(scim:ConnectorConfig config);
```

Invoke the connector operations by passing the required parameters.

```ballerina
scim:UserResource response= check scimClient->getUser("<userId>");
```
