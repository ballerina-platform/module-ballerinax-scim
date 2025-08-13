# Asgardeo Integration Example

This example demonstrates how to provision new users in Asgardeo using the SCIM connector.

## Prerequisites

1. Follow instructions to set up OAuth2 app in Asgardeo.

2. Create a `config.toml` file with your Asgardeo credentials. Example:

```toml
clientId = "<client-id>"
clientSecret = "<client-secret>"
orgName = "<asgardeo-org-name>"
```

## Run the Example

1. Execute the following command to run the example:

```bash
bal run
```

2. Send the following CURL command to provision a user in Asgardeo:

```bash
curl -X POST "http://localhost:8080/asgardeo/createUser" \
  -H "Content-Type: application/json" \
  -d '{
        "primaryWorkEmail": "hermione@hogwarts.com",
        "name": "Hermione",
        "isManager": false,
        "businessTitle": "Software Engineer"
    }'
```