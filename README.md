# Ballerina SCIM connector

[![Build](https://github.com/ballerina-platform/module-ballerinax-scim/actions/workflows/ci.yml/badge.svg)](https://github.com/ballerina-platform/module-ballerinax-scim/actions/workflows/ci.yml)
[![GitHub Last Commit](https://img.shields.io/github/last-commit/ballerina-platform/module-ballerinax-scim.svg)](https://github.com/ballerina-platform/module-ballerinax-scim/commits/master)
[![GitHub Issues](https://img.shields.io/github/issues/ballerina-platform/ballerina-library/module/scim.svg?label=Open%20Issues)](https://github.com/ballerina-platform/ballerina-library/labels/module%scim)

## Overview

SCIM (System for Cross-domain Identity Management) is a widely-adopted standard protocol for automating the exchange of user identity information between identity domains, or IT systems.

The `ballerinax/scim` package offers APIs to connect with SCIM 2.0 compliant identity providers and services.

## Setup guide

### Asgardeo Setup

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
scim:UserObjectListResponseObject userList = check scim->/Users();
```

## Examples

The `scim` connector provides practical examples illustrating usage in various scenarios. Explore these [examples](https://github.com/module-ballerinax-scim/tree/main/examples/), covering the following use cases:

1. [**Asgardeo Integration**](https://github.com/ballerina-platform/module-ballerinax-scim/tree/main/examples/asgardeo-integration) – Demonstrates how to provision and manage users in Asgardeo using the SCIM connector. This example shows how to securely connect to Asgardeo SCIM API, create new users, and synchronize identity data between systems.

## Build from the source

### Setting up the prerequisites

1. Download and install Java SE Development Kit (JDK) version 21. You can download it from either of the following sources:

    * [Oracle JDK](https://www.oracle.com/java/technologies/downloads/)
    * [OpenJDK](https://adoptium.net/)

   > **Note:** After installation, remember to set the `JAVA_HOME` environment variable to the directory where JDK was installed.

2. Download and install [Ballerina Swan Lake](https://ballerina.io/).

3. Download and install [Docker](https://www.docker.com/get-started).

   > **Note**: Ensure that the Docker daemon is running before executing any tests.

4. Export Github Personal access token with read package permissions as follows,

    ```bash
    export packageUser=<Username>
    export packagePAT=<Personal access token>
    ```

### Build options

Execute the commands below to build from the source.

1. To build the package:

   ```bash
   ./gradlew clean build
   ```

2. To run the tests:

   ```bash
   ./gradlew clean test
   ```

3. To build the without the tests:

   ```bash
   ./gradlew clean build -x test
   ```

4. To run tests against different environments:

   ```bash
   ./gradlew clean test -Pgroups=<Comma separated groups/test cases>
   ```

5. To debug the package with a remote debugger:

   ```bash
   ./gradlew clean build -Pdebug=<port>
   ```

6. To debug with the Ballerina language:

   ```bash
   ./gradlew clean build -PbalJavaDebug=<port>
   ```

7. Publish the generated artifacts to the local Ballerina Central repository:

    ```bash
    ./gradlew clean build -PpublishToLocalCentral=true
    ```

8. Publish the generated artifacts to the Ballerina Central repository:

   ```bash
   ./gradlew clean build -PpublishToCentral=true
   ```

## Contribute to Ballerina

As an open-source project, Ballerina welcomes contributions from the community.

For more information, go to the [contribution guidelines](https://github.com/ballerina-platform/ballerina-lang/blob/master/CONTRIBUTING.md).

## Code of conduct

All the contributors are encouraged to read the [Ballerina Code of Conduct](https://ballerina.io/code-of-conduct).

## Useful links

* For more information go to the [`scim` package](https://central.ballerina.io/ballerinax/scim/latest).
* For example demonstrations of the usage, go to [Ballerina By Examples](https://ballerina.io/learn/by-example/).
* Chat live with us via our [Discord server](https://discord.gg/ballerinalang).
* Post all technical questions on Stack Overflow with the [#ballerina](https://stackoverflow.com/questions/tagged/ballerina) tag.
