# Authorization Service
OAuth2 Authorization Server using Spring Security for securing microservices with JWT tokens.
This service provides endpoints for user registration, login, and token validation.

## Environments
- **Local**: `http://localhost:8080`
- **Testing**: `https://test-auth.example.com`
- **Staging**: `https://staging-auth.example.com`
- **Production**: `https://auth.example.com`

## Running the Service

### Run Locally
To run the service locally, you can use the following command:
```bash
./gradlew bootRun --args='--spring.profiles.active=local'
```


