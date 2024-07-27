# OOD - Inheritance
- part of [OOD](./ood-object-oriented-design.md#inheritance)

Inheritance solves the problem of related types that share a great deal of common behavior but differ across some dimension.
It allows you to isolate shared code and implement common algorithms in an abstract class, while also providing a structure
that permits subclasses to contribute specializations.

The best way to create a superclass is by pushing code _up_ from concrete subclasses,
Identifying the correct abstraction is easiest if you have access to at least three existing concrete classes.
(More info -> better design decisions)

Abstract superclasses use the _template method_ pattern to invite inheritors to supply specializations,
and use _hook_ methods to allow these inheritors to contribute these specializations,
without being forced to send `super`.

Hook methods allow subclasses to contribute specializations without knowing the abstract algorithm.
They remove the need for subclasses to send `super` and therefore reduce the coupling between layers
of hierarcy and increase tolerance for change.

Well-designed inheritance hierarchies are easy to extend with new subclasses,
even for programmers who know very little about the application.
This ease of extension is inheritance's greatest strength.

When your problem is one of needing numerous specializations of a stable, common abstraction,
inheritance can be an extremely low-cost solution.

## Review:
- [Writing Inheritable Code](#writing-inheritable-code)
- [Recognizing Antipatterns (Inheritance)](#recognizing-antipatterns-inheritance)
- [Insist on the Abstraction](#insist-on-the-abstraction)
- [Substitutability](#substitutability)
- [Using the Template Method Pattern](#using-the-template-method-pattern)
- [Preemptively Decouple Classes](#preemptively-decouple-classes)
- [Create Shallow Hierarchies](#create-shallow-hierarchies)

___

## Acquiring Behavior Through Inheritance
- well designed applications are constructed of reusable code
- small, trustworthy self-contained objects with [minimal context](#context-independence), clear interfaces, and injected dependencies are inherently reusable
- code sharing is done through _inheritance_

## Understanding Classical Inheritance
- inheritance is a mechanism for _automatic message delegation_
- it forwards not-understood messages
- if one object cannot respont to a received message, it delegates that message to another
- the forwarding of messages happens automatically once you define an inheritance relationship between two objects
- in classical inheritance these relationships are defined by creating _subclasses_
- _classical_ is a play on the term _class_, not a nod to an archaic technique
- classical inheritance has a superclass/subclass mechanism
- JavaScript has prototypical inheritance and Ruby has modules

## When to Use Inheritance / Finding the Embedded Types
What patterns indicate that a class should contain a inheritance?

- When names of variables indicate an underlying pattern (like: `Bicycle.type` or `Bicycle.category`).
- Variables that divide instances of a class into different things.
- Two things that _share a great deal of behavior_ but differ along a `style` dimension, for example.
- When a single class contains several different but related types, inheritance should be used.

Inheritance should be used when instances of highly related types that _share common behavior_ but _differ along some dimension_.

## Choosing Inheritance
- Inheritance is a _design idea_
- When an object receives a message, it either responds directly to the message or passes it along to another object for a response.

## Definition of Inheritance
Inheritance provides a way to define two objects as having a relationship such that
when the first receives a message it does not understand, it _automatically_ forwards,
or delegates the message to the second object.

## Single inheritance
A superclass can have many sublcasses, but a subclass can only have one superclass.

## Duck Types and Classical Inheritance
Message forwarding via classical inhertance takes place between _classes_.
Duck types cut across classes, so they do not use classical inheritance to share common behavior.
Duck types share code via Ruby __modules__.

## Inheritance in Ruby
- Ruby has _single inheritance_ like most OO languages.
- In Ruby every class you create is a subclass from the `Object` superclass.
- Ruby automatically forwards messages up the superclass chain, in search of a matching method implementation.

```ruby
class Bicycle
  # ...
end

class Roacbike < Bicycle
  # ...
end

class MountainBike < Bicycle
  # ...
end
```

## Subclass and Superclass
- subclasses is everything their superclasses are, plus more
- a String is a String, but also an Object. Every String contains Object's entire public interface
- __subclasses are specializations of their superclass__
- superclasses contain the common behavior, subclasses contain the specialization
- abstract classes (superclasses) are meant to be subclassed
- don't create instances of superclasses. In Java, they are declared with the `abstract` keyword and cannot be instantiated
- when creating hierarchy: "it is easier to promote (move) code to a superclass, than it is to demote it down to a subclass"

## Promoting Abstract Behavior
Example use of `super`, where a concrete piece of code is moved _down_ into a subclass,
abstract code moved _up_ into superclass:

```ruby
class Bicycle
  attr_reader :size    # <- promoted from RoadBike

  def initialize(args={})
    @size = args[:size]    # <- promoted from RoadBike
  end
end

class RoadBike < Bicycle
  attr_reader :tape_color

  def initialize(args)
    @tape_color = args[:tape_color]
    super(args)    # <- RoadBike now MUST send 'super'
  end
  # ...
end
```

- `size` is abstract and belongs to all bikes
- `tape_color` is concreate and belongs to RoadBikes only

## Template Method Pattern
Wrap defaults in methods. Give subclasses the opportunity to contribute specializations by overriding them.
The technique of defining a basic structure in the superclass and sending messages to acquire subclass-specific contributions is know as the _template method_ pattern.

The subclass sends the defaults up to the superclass.

```ruby
class Bicycle
  attr_reader :size, :chain, :tire_size

  def initialize(args={})
    @size =      args[:size]
    @chain =     args[:chain]     || default_chain
    @tire_size = args[:tire_size] || default_tire_size
  end

  def default_chain # <- common default
    '10-speed'
  end
end

class RoadBike < Bicycle
  # ...

  def default_tire_size # <- subclass default
    '23'
  end
end

class MountainBike < Bicycle
  # ...

  def default_tire_size # <- subclass default
    '2.1'
  end
end

```

`Bicycle` provides the structure, a common algorithm, for its subclasses.
Here the subclasses implement their own defaults for tire size, but use the common `default_chain`.

WARNING: `Bicycle` does not implement `default_tire_size`, but it is sent in `initialize`. This may cause problems downstream.
This means that `Bicycle` imposed a _requirement_ on its subclasses, they must provide `default_tire_size`.
This rule can be explicitly stated:

```ruby
class Bicycle
  # ...

  def default_tire_size
    raise NotImplementedError,
      "This #{self.class} cannot respond to:"
  end
end
```

This serves as _documentation_, because when called it gives useful information:

```ruby
bent = RecumbentBike.new
  # NotImplementedError:
  #   This RecumbentBike cannot respond to:
  #     `default_tire_size'
```

## Managing Coupling Between Superclasses and Subclasses
Managing coupling is important: tightly coupled classes stick together and may be impossible to change independently.

## Understanding Coupling
When promoting abstract code to superclasses, be careful how much subclasses need to know about their parent's implementation of default methods.

Knowing things about other classes creates dependencies and dependencies couple object together.
Example: what if a subclass forgets to send `super` during its own `initialize`. It will miss out on its parents defaults and cause problems.

Forcing a subclass to know how to interact with its superclass causes many problems:
- Duplication of code across subclasses, where each has to send `super` in exactly the same place.
- Programmers in the future will lack the knowledge to do so.
- If the superclass algorithm changes, it breaks all subclasses!

## Decoupling Subclasses Using Hook Messages
Instead of subclasses knowing the algorithm requiring them to send `super`:

> Superclasses can instead send _hook_ messages, that exist solely to provide subclasses a place to contribute information
by implementing matching methods.

```ruby
class Bicycle
  def initialize(args={})
    @size =      args[:size]
    @chain =     args[:chain]     || default_chain
    @tire_size = args[:tire_size] || default_tire_size

    post_initialize(args) # Bicycle both sends
  end

  def post_initialize(args) # and implements this
    nil
  end

  # ...
end

class RoadBike < Bicycle
  def post_initialize(args)         # RoadBike can
    @tape_color= args[:tape_color]  # optionally
  end                               # override it

  # ...
end

```

This doesn't just remove `super`, it removes `initialize` altogether.
RoadBike does not control initialization, it only does the specialization.

This allows RoadBike to know less about Bicycle, decoupling the classes.

Example: using a _hook_ to merge a hash:

```ruby
class Bicycle
  # ...
  def spares
    { tire_size: tire_size,
      chainL:    chain}.merge(local_spares)
  end

  def local_spares
    {}
  end
end

class RoadBike < Bicycle
  # ...
  def local_spares
    {tape_color: tape_color}
  end
end
```

See page 136 for full refactor example.

## [Sharing Role Bahavior with Modules](./ood-roles-modules.md)

## Method Lookup in Classical Inheritance
In classical inheritance, when a message is sent to an _instance_ of a class,
the OO language first looks for the matching method inside that class.
It then proceeds up the superclass chain.

## Method Lookup in Ruby
When a message is sent to an instance of a class,
the method lookup hierarchy is:

1. Singleton Class: methods defined only in this one instance
2. Modules: methods defined in modules with which this instance has been _extended_
3. Class: methods defined in the class of the instance
4. Modules: methods defined in modules included in the class
5. Superclass: methods defined in the superclass of the subclass
6. Modules: methods defined in the modules included in the superclass
7. Object: methods defined in class Object

Inherited methods can be overwritten in any step of the hierarchy!

## Writing Inheritable Code
The usefulness and maintainability of inheritance hierarchies and modules is in direct proportion to the quality of code.
Sharing inherited behavior requires specific coding strategies:

## Recognizing Antipatterns (Inheritance)
There are two [antipatterns](./ood-object-oriented-design.md#antipattern) that indicate
that code might benefit from inheritance:
1. Objects that use a variable name like `type` or `category` to determine which message to send to `self`.
  Meaning that these objects are of highly related, but slightly different types.
  They can benefit from [Classical Inheritance](#understanding-classical-inheritance),
  where comon code is moved to an abstract superclass.
2. When sending objects check the class of a receiving object to determine what message to send.
  They can benefit from [Duck Types](./duck-type.md).
  In this situation all receiving objects play a common role.
  They should be codified as a duck type and receivers should implement the duck type's interface.
  Once they do, the original object can send one single message to every receiver, trusting that they will respond.
  In addition to sharing an interface, duck types might also [share behavior](./ood-roles-modules.md#sharing-role-bahavior-with-modules).
  When they do, place shared code in a module and include that module in each class or object that plays the role.

## Insist on the Abstraction
All the code in an abstract superclass should apply to every class that inherits it.
Superclasses should not contain code that applies to some, but not all superclasses.
This restriction also applies to modules.

## Substitutability
Subclasses agree to a _contract_; they promise to be substitutable for their superclasses.
They are __substituatable__ when they implement their superclass's interface.
- see: [Liskov Substitution Principle LSP](./solid.md)

## Using the Template Method Pattern
- [Template Method Pattern example](#template-method-pattern)

A fundamental technique in creating inheritable code is using the Template Method Pattern.

This pattern allows you to separate abstract from concrete code:
- The abstract code defines the algorithm
- the concrete inheritors of these abstractions contribute specializations that override these template methods

The template methods represent the parts of the algorithm that vary and creating them forces you to make decisions
on what varies and what does not.
This shields you from having to make changes in subclasses that implement templates,
allowing the algorithm to change in the superclass, thereby reducing cost.

## Preemptively Decouple Classes
Avoid writing code that requires its inheritors to send `super`; instead use [hook messages](#decoupling-subclasses-using-hook-messages) to allow subclasses to participate while absolving them of  responsibility for knowing the abstract algorithm.
Avoiding `super` removes dependency on knowing what/how the superclass implements methods.
Limitation: sometimes subclasses are forced to use and override the hook method.

## Create Shallow Hierarchies
Every hierarchy can be thought of as a pyramid with depth and breadth:
- an object's depth is the number of superclasses between it and the top
- its breadth is the number of its direct subclasses

See page 161 for illustrations of shapes of the hierarchy piramid,
each more complex, costly to maintain, and difficult to understand than the previous:
- shallow, narrow
- shallow, wide
- deep, narrow 
- deep, wide

## Accepting the Consequences of Inheritance
Making wise choices about using inheritance requires a clear understanding of its costs and benefits.

## Benefits of Inheritance
[Designing Classes with a Single Responsibility](#designing-classes-with-a-single-responsibility) outlined four goals of code:
transparent, reasonable, usable, exemplary.
Inheritance when applied correctly, excels at the second, third, and fourth goals.
Methods defined near the top of inheritance hierarchies have widespread influence
because the height of the hierarchy acts as a lever that multiplies their effects.
Changes made to these methods ripple down the inheritance tree.
Correctly modelled hierarchies are _reasonable_; big changes in behavior can be achieved via small changes in code.

Use of inheritance results in code that can be described as __open-closed__; hierarchies are open for extension
while being closed for modification.
Adding a new subclass to an existing hierarchy requires no changes in code.
Hierarchies are thus _usable_; you can easily create new subclasses to accommodate new variants.
- see [SOLID: O](./solid.md#o---open-closed-principle)

Correctly written hierarchies are easy to extend.
Their hierarchy embodies the abstraction and every new subclass plugs in a few concrete differences.
Hierarchies are _exemplary_; by their nature they provide guidence for writing the code to extend them.
Example from Ruby: `Integer` and `Float` are subclasses of `Numeric`. The _is-a_ relationship is right: Integers and Floats are Numbers.

## Costs of Inheritance
Concerns about inheritance:
- Using inheritance to solve the wrong kinds of problems: down the line you realise there is no easy way to add behavior
and must restructure code.
- Even when inheritance makes sense for the problem: you might be writing code that will be used by others for purposes
you did not anticipate. They may not be able to tolerate the dependencies that inheritance demands.

^ The above applies to a _correctly modeled_ hierarchy.
With an incorrectly modeled hierarchy, you encounter a double detriment.
- The flipside of _reasonable_ is the very high cost of making changes near the top of an incorrectly modeled hierarchy.
The leverage effect makes even small changes break everything.
- The opposite of _usable_ is the inability to add behavior when a subclass represents a mixture of two types.
Combining the qualities of two classes is impossible in an incorrectly modeled hierarchy.
You cannot use the hierarchy without changing it, therefor it is _unusable_.
- The other side of _exemplary_ is when novice programmers are unable to extend incorrectly modeled hierarchies.
These hierarchies should be refactored, not extended, but the novice will not know how to do so.
Novices are forced to douplicate code, or to add dependencies on class name, which just exacerbated bad design decisions.

Inheritance is where the question: "What will happen if I am wrong" assumes special importance.
Inheritance by definition comes with a deeply embedded set of _dependencies_.
Subclasses _depend_ on methods defined in their superclasses and the automatic delegation of messages to those superclasses.
Classical inheritances biggest strength and weakness; subclasses are bound irrevocably and by design to their superclasses.
These built-in dependencies amplify the effects of modifications made to these superclasses.
Enormous, broad reaching changes in behavior can be made with small changes in code.

## Use Inheritance for is-a Relationships
- Small sets of real-world objects fall naturally into static, transparently obvious specialization hierarchies.
- Use when _varients_ of a class are likely, rather than objects that are _different_.
- Hierarchies should be shallow and narrow, making them easy to understand, intention revealing and easily extendible.
- Use when the costs of change are low.
