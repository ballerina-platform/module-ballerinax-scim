# Examples

The `ballerinax/scim` connector provides practical examples illustrating usage in various scenarios.

1. [Asgardeo Integration](https://github.com/ballerina-platform/module-ballerinax-scim/tree/main/examples/asgardeo-integration) – Demonstrates how to provision and manage users in Asgardeo using the SCIM connector. This example shows how to securely connect to Asgardeo SCIM API, create new users, and synchronize identity data between systems.

## Prerequisites

1. Follow instructions to set up OAuth2 app in Asgardeo.

2. Create a `Config.toml` file with your Asgardeo credentials. Example:

```toml
clientId = "<client-id>"
clientSecret = "<client-secret>"
orgName = "<asgardeo-org-name>"
```

## Running an example

Execute the following commands to build an example from the source:

* To build an example:

    ```bash
    bal build
    ```

* To run an example:

    ```bash
    bal run
    ```

## Building the examples with the local module

**Warning**: Due to the absence of support for reading local repositories for single Ballerina files, the Bala of the module is manually written to the central repository as a workaround. Consequently, the bash script may modify your local Ballerina repositories.

Execute the following commands to build all the examples against the changes you have made to the module locally:

* To build all the examples:

    ```bash
    ./build.sh build
    ```

* To run all the examples:

    ```bash
    ./build.sh run
    ```
