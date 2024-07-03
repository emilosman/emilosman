# DDD - Domain Driven Design
- [Pattern: Decompose by subdomain](https://microservices.io/patterns/decomposition/decompose-by-subdomain.html)

## DDD in Ruby on Rails
- [Introduction to DDD in Ruby on Rails](https://www.visuality.pl/posts/introduction-to-ddd-in-ruby-on-rails)
- [Domain Modeling in Ruby on Rails with introduction to Domain-Driven Design - Paweł Strzałkowski](https://www.youtube.com/watch?v=94Atco5-tRQ)
- [How to use DDD with Ruby on Rails, the path of a domain-driven warrior - Paweł Strzałkowski](https://www.youtube.com/watch?v=tUfc7t9JW-8&t=3070s)

## Solution
Define services corresponding to Domain-Driven Design (DDD) subdomains.
DDD refers to the application’s problem space - the business - as the domain.
A domain is consists of multiple subdomains. Each subdomain corresponds to a different part of the business.

Subdomains can be classified as follows:
- Core - key differentiator for the business and the most valuable part of the application
- Supporting - related to what the business does but not a differentiator. These can be implemented in-house or outsourced.
- Generic - not specific to the business and are ideally implemented using off the shelf software

## Anemic Domain Model
- [wiki](https://en.wikipedia.org/wiki/Anemic_domain_model)
- [Martin Fowler - Anemic Domain Model](https://www.martinfowler.com/bliki/AnemicDomainModel.html)

The anemic domain model is described as a programming [antipattern](/pages/ood-object-oriented-design.md#antipattern) where the domain objects contain little or no business logic like validations, calculations, rules, and so forth. The business logic is thus baked into the architecture of the program itself, making refactoring and maintenance more difficult and time-consuming. 
