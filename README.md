# API Gateways and Microservices

This repository is a supplementary material for my thesis _API Gateways and Microservices_ and it extends the original repository [GoogleCloudPlatform
/
microservices-demo](https://github.com/GoogleCloudPlatform/microservices-demo) in the following ways:

1. Adds a new service called `postgresservice` that encapsulates a Postgres database and thus provides permanent storage for the application. The database schema could be found in file `src/postgresservice/schema.sql`.
2. Modifies `checkoutservice`, which is responsible for creating the order, so it sends the created order into the `postgresservice`, so the order data are stored in permanent storage and could be accessed later.
3. Adds a new service called `resapiservice` that ensapsulates a lightweight REST API implemented using Express Node.js framework. The API exposes the orders stored in `postgresservice` via following endpoints:

    1. Collections of resources, each endpoint supports limit and offset query parameters:
        - `GET /orders`
        - `GET /order_items`
        - `GET /addresses`
        - `GET /shippings`
    2. Endpoints to retrieve a single instance of a resource, identified by id:
        - `GET /order/:id`
        - `GET /order_item/:id`
        - `GET /address/:id`
        - `GET /shipping/:id`

In the directory `performance-tests/results`, there are data from performance testing of the latencies of the API queries when run through the API Gateways Tyk, KrakenD and Kong. The test definition file created in the JMeter application can be found in `performance-tests/api_test.jmx` 

The original README file was renamed to [README.original.md](README.original.md).