## Overview

SCIM (System for Cross-domain Identity Management) is a widely-adopted standard protocol for automating the exchange of user identity information between identity domains, or IT systems.

The `ballerinax/scim` package offers APIs to connect with SCIM 2.0 compliant identity providers and services.

## Setup guide

### Asgardeo

#### Step 1: Register a Machine-to-Machine (M2M) application

1. On the Asgardeo Console, click Applications.

    ![Select App](https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-scim/main/docs/setup/resources/1-select-app-type.png)

2. Click New Application and select M2M Application.

3. In the Name field, enter a unique name to identify your application.

4. Click Register to complete the registration.


#### Step 2: Authorize the API resources for the app

You can authorize your M2M application to access APIs and their scopes(permissions) from API Authorization tab of the application, as shown below.

![Authorize APIS](https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-scim/main/docs/setup/resources/2-authorize-apis.png)

#### Step 3: Get the client ID and secret

When you register your M2M application, a client ID and client secret are generated. Your M2M application will identify itself to Asgardeo with these credentials.

You can get this client ID and client secret from the Protocol tab of the application, as shown below.

![Client Id and Secret](https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-scim/main/docs/setup/resources/3-client-id-secret-m2m.png)

## Quickstart

To use the `scim` connector in your Ballerina application, modify the `.bal` file as follows:

### Step 1: Import the module

Import the `scim` module.

```ballerina
import ballerinax/scim;
```

### Step 2: Instantiate a new connector

Create a `scim:ConnectionConfig` with the obtained OAuth2.0 credentials and initialize the connector with it.

```ballerina
configurable string orgName = ?;
configurable string clientId = ?;
configurable string clientSecret = ?;

scim:Client scim = check new (serviceUrl = string `https://api.asgardeo.io/t/${orgName}/scim2`,
        config = {
            auth: {
                tokenUrl: string `https://api.asgardeo.io/t/${orgName}/oauth2/token`,
                clientId: clientId,
                clientSecret: clientSecret,
                scopes: ["internal_user_mgt_list", "internal_group_mgt_view"]
            }
        }
    );
```

### Step 3: Invoke the connector operation

Now, utilize the available connector operations.

#### List all the users in the store

```ballerina
UserObjectListResponseObject userList = check scim->/Users();
```

## Examples

The `scim` connector provides practical examples illustrating usage in various scenarios. Explore these [examples](https://github.com/module-ballerinax-scim/tree/main/examples/), covering the following use cases:

1. [**Asgardeo Integration**](https://github.com/ballerina-platform/module-ballerinax-scim/tree/main/examples/asgardeo-integration) – Demonstrates how to provision and manage users in Asgardeo using the SCIM connector. This example shows how to securely connect to Asgardeo SCIM API, create new users, and synchronize identity data between systems.
