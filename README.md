# mPOWEr API

A simplified FHIR-based backend API application using the mPOWEr data model.

## Setup
(see https://docs.docker.com/compose/gettingstarted/)

1. Install Docker and Docker compose.
2.  Clone project into desired working directory:
    ```
    git clone https://github.com/uwcirg/mpower_api.git
    ```
3.  Build and run the containers
    ```
    cd mpower_api
    docker-compose up
    ```

4. Navigate to http://localhost:5000/hello. You should get an `Welcome to mPOWEr!` message.
