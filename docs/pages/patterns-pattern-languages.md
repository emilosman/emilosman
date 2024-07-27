# Patterns and Pattern Languages
- Pattern: a reusable solution to a problem that occurs in a particular context.
- Pattern language: a collection of related patterns that solve problems within a particular domain.
- A pattern must describe the context within which it applies.

## References
- [Arcitura patterns](/pages/arcitura-patterns.md)
- [Azure reference architectures](/pages/azure.md#reference-architectures)
- Design Patterns: Elements of Reusable Object-Oriented Software (Addison-Wesley Professional, 1994)
- [OOD: Template Method Pattern](/pages/ood-inheritance.md#using-the-template-method-pattern)

## Pattern structure
1. **Forces**: The issues that you must address when solving a problem
  - Forces can conflict, so it might not be possible to solve all of them. Which forces are more important depends on the context. You have to prioritize solving some forces over others. For example, code must be easy to understand and have good performance.
  Code written in a reactive style has better performance than synchronous code, yet is often more difficult to understand.
  See: [Synchronous vs Asynchronous (Ractive) programming](/pages/synchronous-asynchronous-reactive-push-pull.md).
  Explicitly listing the forces is useful because it makes clear which issues need to be solved.
2. **Resulting context**: Context are the consequences of applying a pattern
  - _Benefits_: “The benefits of the pattern, including the forces that have been resolved
  - _Drawbacks_: “The drawbacks of the pattern, including the unresolved forces
  - _Issues_: “The new problems that have been introduced by applying the pattern
3. **Related patterns**: the relationship between the pattern and other patterns. There are five types of relationships between patterns:
  - _Predecessor_: a pattern that motivates the need for this pattern. For example, the Microservice architecture pattern is the predecessor to the rest of the patterns in the pattern language, except the monolithic architecture pattern.
  - _Successor_: A pattern that solves an issue that has been introduced by this pattern. For example, if you apply the Microservice architecture pattern, you must then apply numerous successor patterns, including service discovery patterns and the Circuit breaker pattern.
  - _Alternative:_ A pattern that provides an alternative solution to this pattern. For example, the Monolithic architecture pattern and the Microservice architecture pattern are alternative ways of architecting an application. You pick one or the other.
  - _Generalization_: A pattern that is a general solution to a problem. Ex: Single service per host pattern.
  - _Specialization_: A specialized form of a particular pattern. Ex: the Deploy a service as a container pattern is a specialization of Single service per host.

## Pattern language
- related patterns and their relationships form pattern languages
- see relationships in ["pattern structure"](#pattern-structure)

## Pattern groups
Patterns within a pattern language can be organized into groups:
0. **Application architecture**: example: Monolithic vs Microservice architecture
1. **Infrastructure patterns**: solve infrastructure issues outside of development (Deployment, Discovery, External API...)
2. **Application infrastructure**: infrastructure issues that impact development (Cross-cutting concers, Security, Observability...)
3. **Application patterns**: solve problems faced by developers (Decomposition, Database architecture, Querying, Maintaining and consistency, Testing...)

- patterns are grouped together based on the kinds of problems they solve. ex: Communication patterns: Transactional messaging, Communication style, Discovery...
- see page 94 diagram that shows different arrows representing relationships: predecesor/successor, alternatives, general/specific

## Pattern for decomposing an application into services
1. Decompose by business capability: organizes services around business capabilities
2. Decompose by subdomain: organizes services around [Domain Driven Design (DDD) subdomains](/pages/ddd-domain-driven-design.md)

## Sidecar pattern
- [Azure: Sidecar pattern](https://learn.microsoft.com/en-us/azure/architecture/patterns/sidecar)
Deploy components of an application into a separate process or container to provide isolation and encapsulation. This pattern can also enable applications to be composed of heterogeneous components and technologies.

This pattern is named Sidecar because it resembles a sidecar attached to a motorcycle. In the pattern, the sidecar is attached to a parent application and provides supporting features for the application. The sidecar also shares the same lifecycle as the parent application, being created and retired alongside the parent. The sidecar pattern is sometimes referred to as the sidekick pattern and is a decomposition pattern.
