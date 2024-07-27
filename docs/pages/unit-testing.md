# Unit Testing
- see: [OOD - Designing Cost Effective Tests](./ood-designing-cost-effective-tests.md)
- see: [Unit Test in the Test Pyramid](./test-pyramid.md#unit-tests)
- [OOD Unit Test Example](./ood-designing-cost-effective-tests.md#proving-the-public-interface--unit-test-example)

## Books
- [Vladimir Khorikov -  Unit Testing Principles, Practices, and Patterns](https://www.manning.com/books/unit-testing)
- [Jay Fields - Working Effectively with Unit Tests](https://leanpub.com/wewut)

## Definition
Unit tests are typically automated tests written and run by software developers to ensure that a section of an application (known as the "unit") meets its design and behaves as intended.
In object-oriented programming, a unit is often an entire interface, such as a class, or an individual method. By writing tests first for the smallest testable units, then the compound behaviors between those, one can build up comprehensive tests for complex applications [wiki](https://en.wikipedia.org/wiki/Unit_testing)

If you find that code is hard to unit test, it’s a strong sign that the code needs improvement. The poor quality usually manifests itself in _tight coupling_, which means different pieces of production code are not decoupled from each other enough, and it’s hard to test them separately. [OOD - Designing Cost Effective Tests](./ood-designing-cost-effective-tests.md)

## Sociable and Solitary
- see: [Test Pyramid: Sociable and Solitary Unit Tests](./test-pyramid.md#sociable-and-solitary-unit-tests)
