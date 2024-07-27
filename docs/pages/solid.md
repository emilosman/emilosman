# SOLID
- [wiki](https://en.wikipedia.org/wiki/SOLID)
- [Article: SOLID: The First 5 Principles of Object Oriented Design](https://www.digitalocean.com/community/conceptual-articles/s-o-l-i-d-the-first-five-principles-of-object-oriented-design)
- [concept by Robert C. Martin (Uncle Bob), inventor of Agile](https://en.wikipedia.org/wiki/Robert_C._Martin)

```
  S - Single-Responsiblity Principle
  O - Open-Closed Principle
  L - Liskov Substitution Principle
  I - Interface Segregation Principle
  D - Dependency Inversion Principle
```

## S - Single-Responsiblity Principle
> There should never be more than one reason for a class to change. In other words, every class should have only one responsibility.

- see: [Designing Classes with a Single Responsibility](./ood-object-oriented-design.md#designing-classes-with-a-single-responsibility)
- The four goals of code: transparent, reasonable, usable, exemplary.
- [wiki](https://en.wikipedia.org/wiki/Single-responsibility_principle)

## O - Open-Closed Principle
Use of inheritance results in code that can be described as __open-closed__; hierarchies are open for extension
while being closed for modification.

- see: [Benefits of Inheritance](./ood-inheritance.md#benefits-of-inheritance)
- [wiki](https://en.wikipedia.org/wiki/Open%E2%80%93closed_principle)

## L - Liskov Substitution Principle
> Let _q(x)_ be a property provable about object _x_ of type _T_.
  Then _q(y)_ should be true for objects _y_ of type _S_ where _S_ is a subtype of _T_.

- In order for a type system to be sane, subtypes must be substitutable for their supertypes.
- In Ruby terms this means that an object should act like what it claims to be.
- Named after Barbara Liskov
- see [Substitutability](./ood-inheritance.md#substitutability)

## I - Interface Segregation Principle
> Clients should not be forced to depend upon interfaces that they do not use.

- [wiki](https://en.wikipedia.org/wiki/Interface_segregation_principle)

## D - Dependency Inversion Principle
> Depend upon abstractions, concretions.

- see: [Inheritance](./ood-inheritance.md)
- [wiki](https://en.wikipedia.org/wiki/Dependency_inversion_principle)
