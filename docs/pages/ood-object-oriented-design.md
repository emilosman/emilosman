# OOD - Object Oriented Design
- [x] [Sandi Metz - Practical Object Oriented Design in Ruby](https://www.poodr.com/) (200/241)
- [Patterns](/pages/patterns-pattern-languages)
- The purpose of OOD is to reduce the cost of change.

## Designing Classes with a Single Responsibility
Code should be:

1. transparent
2. reasonable
3. usable
4. exemplary

## Interfaces - public vs private
- public interfaces (methods) should be small, and few methods of others should depend on them

## Context independence
- context: things you know about other objects
- focus on _what_ instead of _how_ !
- reduce context for ease of re-use

## Trusting other objects
- Coding in a procedural style defeats the purpose of object orientation.
- "I know what I want and I trust you to do your part"
- Blind trust is the keystone of object-oriented design.
- Object1 asks what it wants and passes itself along to Object2

## Using Messages to Discover Objects
- using the messages passed between Objects to discover missing _interfaces_
- Objects now have little context, making them reusable, while an _Interface_ is created that knows how to make an implementation
- this Interface can then be later swapped out if the context changes
- Asking _what_ the Customer wants and implementing a TripFinder object. Customer does not know _how_.
- the interface knows _how_
- **create consistent public interfaces to hide messy and changeable internal implementation details**

## Creating a Message-Based Application
- Build apps based on public interfaces

## Create Explicit Interfaces
- declare public/private interfaces always
- be more about _how_ than _why_
- have names that don't change
- take a hash as options parameter

## [Managing Dependencies](/pages/ood-managing-dependencies)

## Creating Flexible interfaces
- use [UML](/pages/uml-unified-modeling-language-c4) sequence diagrams to illustrate passing messages

## Tests
- see: [Designing Cost Effective Tests](/pages/ood-designing-cost-effective-tests)
- Test public interfaces only
- Tests serve as documentation

## Public, Protected, and Private Methods
- private:
  - least stable and subject to change often
  - can only be called implicitly or with self (fun_factor, self.fun_factor)
- protected:
  - unstable, but different visibility than private
  - can be called from same kind of thing, class or subclass
- public: stable, visible everywhere

You can overrule private and protected and call them from the outside, if you insist!
Rails adds a leading "_" to the beginning of private methods: ._fun_factor

## Law of Demeter (LoD)
- Set of coding rules that results in loosely coupled objects
- It prohibits routing a message to a third object via a second object of a different type
- "Use only one dot"
- "train wreck"
- NO: `customer.bicycle.wheel.rotate`
- YES: `customer.ride`

## [Duck type](/pages/duck-type)

## Antipattern
- antipattern: a common pattern that appears to be beneficial but is actually detrimental, _and for which there is a well known alternative_.

## Polymorphism
- morph (form), morphism (the state of having a form), polymorphism (state of having many forms)
- polymorphism in OOP is the ability of many different objects to respond to the same message ([duck typing](/pages/duck-type), [inheritance via module, roles](/pages/ood-roles-modules) in Ruby)
- senders do not care about the class of the receiver; receivers supply their own different versions of the behavior
- a single message has many (poly) forms (morphs)
- polymorphic methods are interchangeable from the senders point of view; objects implementing polymorphic methods can be substituted for one another

## [Inheritance](/pages/ood-inheritance)

## [Sharing Role Behavior with Modules](/pages/ood-roles-modules)

## [Combining Objects With Composition](/pages/ood-composition)

## Deciding Between Inheritance and Composition
1. Classical inheritance is a _code arrangement technique_
- behavior is dispersed among objects and these objects are organized into class relationships
such that automatic delegation of messages invokes the correct behavior.
- for the cost of arranging objects in a hierarchy, you get message delegation for free.

2. Composition is an alternative that reverses these costs and benefits
- the relationship between objects is not defined by class hierarcy
- objects stand alone and must explicitly know about and delegate messages to one another
- composition allows objects to have structural independence, but at the cost of explicit message delegation

When to use which?
- composition contains far fewer built-in dependencies than inheritance; often the better choice
- inheritance is sometimes the better choice when it offers high reward and low risk

- [Inheritance: Pros and Cons](/pages/ood-inheritance#accepting-the-consequences-of-inheritance)
- [Composition: Pros and Cons](/pages/ood-composition#accepting-the-consequences-of-composition)

## Choosing Relationships
These all solve different problems:
- [Classical Inheritance](/pages/ood-inheritance)
- [Roles and Modules](/pages/ood-roles-modules)
- [Composition](/pages/ood-composition)

Tips on which one to choose:
- "Inheritance is specialization."
- "Inheritance is best suited for adding functionallity to existing classes
when you use the most of the old code and add relatively small amounts of new code."
- Use composition when behavior is more than the sum of its parts."

1. [Use Inheritance for is-a Relationships](/pages/ood-inheritance#use-inheritance-for-is-a-relationships)
2. [Use Duck Types for behaves-like-a Relationships](/pages/ood-roles-modules#use-duck-types-for-behaves-like-a-relationships)
3. [Use Composition for has-a Relationships](/pages/ood-composition#use-composition-for-has-a-relationships)

The _is-a_ versus _has-a_ distinction is the core of deciding between inheritance and composition.
The more parts an object has, the more likely it should be modeled as a _composition_.
If you drill down into individual parts and find specialized varieties of parts, the more likely it is _inheritance_.

## [Desigining Cost Effective Tests](/pages/ood-designing-cost-effective-tests)
