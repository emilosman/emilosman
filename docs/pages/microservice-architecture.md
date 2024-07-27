# Microservices Architecture
- [ ] [Chris Richardson - Microservices Patterns: With examples in Java](https://www.manning.com/books/microservices-patterns) (96/1145)
- The high-level definition of microservice architecture (microservices) is an architectural style that functionally decomposes an application into a set of services.

## Microservices Patterns: With examples in Java
- [Chris Richardson - Microservices Patterns: With examples in Java](https://www.manning.com/books/microservices-patterns)
- [microservices.io](https://microservices.io/)

## Living in Monolithic Hell
- monoliths have no fault isolation - because all modules are running within the same process.
Every so often, a bug in one module — for example, a memory leak — crashes all instances of the application, one by one.
- [functional / non-functional requirements](/pages/functional-non-functional-requirements.md)

## Scale Cube
The scale cube defines three separate ways to scale an application:
- X-axis scaling load balances requests across multiple, identical instances
  - horizontal scaling, duplication, scale by cloning
  - run multiple instances behind a load balancer
  - N identical instances of an application
- Y-axis functionally decomposes an application into services.
  - this is microservices architecture
  - scale by splitting things that are different, by function
  - each service can then be scaled on X-axis again
- Z-axis scaling routes requests based on an attribute of the request
  - data partitioning
  - each application instance is responsible for a subset of users.
  - scale by splitting similar things, such as by customer ID

## Microservices as a form of modularity
- A service has an API, which is an impermeable boundary that is difficult to violate. You can’t bypass the API and access an internal class
- Services can be scaled and deployed individually

## Each service has its own database
- Microservices are loosely coupled and communicate only via APIs
- Each service has its own data store
- During development, developers can change schemas without having to coordinate with other developers working on a different service
- At runtime, services are isolated from one another. No one service can hold up the another with a database lock.
- This doesn't mean that each service has to have its own database server!
- [Pattern: Database per service](https://microservices.io/patterns/data/database-per-service.html)

## [Microservices vs SOA](soap-soa.md#soa---service-oriented-architecture)

## Benefits of microservice architecture
- It enables the continuous delivery and deployment of large, complex applications.
- Services are small and easily maintained.
- Services are independently deployable.
- Services are independently scalable.
- Better fault isolation
- The microservice architecture enables teams to be autonomous.
- It allows easy experimenting and adoption of new technologies.

## Drawbacks of microservice architecture
- Each service has its own database, which makes it a challenge to implement transactions and queries that span services. A microservices-based application must use what are known as _sagas_ to maintain data consistency across services.
- A microservices-based application can’t retrieve data from multiple services using simple queries. Instead, it must implement queries using either API composition or CQRS views.

## CQRS - Command and Query Responsibility Segregation
- [CQRS pattern](https://docs.microsoft.com/en-us/azure/architecture/patterns/cqrs)
CQRS stands for _Command and Query Responsibility Segregation_, a pattern that separates read and update operations for a data store. Implementing CQRS in your application can maximize its performance, scalability, and security.

## [Patterns and Pattern languages](/pages/patterns-pattern-languages.md)

## Warning: distributed monolith
If you decompose a system incorrectly, you risk building a distributed monolith, a system consisting of coupled services that must be deployed together. This has the drawbacks of both monoliths and microservices.

## Dapr - Distributed Application Runtime
Dapr is a portable, event-driven runtime that makes it easy for any developer to build resilient, stateless, and stateful applications that run on the cloud and edge and embraces the diversity of languages and developer frameworks.
- [docs](https://docs.dapr.io/concepts/overview/)
- [Explore Dapr integration with Azure Container Apps](https://learn.microsoft.com/en-gb/training/modules/implement-azure-container-apps/7-explore-distributed-application-runtime)

## Service Discovery
Services typically need to call one another. In a monolithic application, services invoke one another through language-level method or procedure calls. In a traditional distributed system deployment, services run at fixed, well known locations (hosts and ports) and so can easily call one another using HTTP/REST or some RPC mechanism. However, a modern microservice-based application typically runs in a virtualized or containerized environments where the number of instances of a service and their locations changes dynamically.
- [Pattern: Server-side service discovery](https://microservices.io/patterns/server-side-discovery.html)
