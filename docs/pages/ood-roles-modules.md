# Roles and Modules
- part of [OOD](./ood-object-oriented-design.md#combining-objects-with-composition)
- see: [Composition](./ood-composition.md)
- see: [Duck Types](./duck-type.md)

When objects that play a common role need to share behavior, they do so via a Ruby module.
The code defined in a module can be added to any object, be it an instance of a class, the class itself, or another module.

When a class includes a module, the methods in that module get put into the same lookup path as methods acquired via inheritance.

Modules should use the [Template Method](./ood-inheritance.md#template-method-pattern) pattern to invite those that include them
to supply specializations and should implement [hook methods](./ood-inheritance.md#decoupling-subclasses-using-hook-messages)
to avoid includers to send `super` (and thus know the algorithm).

When an object acquires behaviour through [classical inheritance](./ood-inheritance.md#subclass-and-superclass)
or an included module, it makes a commitment to honoring an implied contract.

This contract is defined by [Liskov Substitution Principle](./solid.md#l---liskov-substitution-principle)
which in mathematical terms says that a subtype should be substitutable for its supertype.
In Ruby terms this means that an object should act like what it claims to be.

## Sharing Role Bahavior with Modules
- Classical inheritance cannot combine behavior of multiple subclasses.
- Alternative to Classical inheritance is sharing behavior through _roles_.
- Ruby _modules_ are used to define a common roles

## Understanding Roles
- Some problems require sharing behavior among unrelated objects.
- This common behavior is orhogonal to class; it's a _role_ an object plays.
- When formerly unrelated objects begin to play a common role, they enter into a relationship with other objects with whom they play the role.
- These roles are not as visible as superclass/subclass hierarchies.
- Roles also create dependencies and this introduces risk.

## Finding Roles
- Example: [`Preparer` duck type is a role](./duck-type.md#example-of-duck-type-preparer)

Objects that implement `Preparer`s interface play the _role_ of `Preparer`: Mechanic, TripCoordinator...
Because they each implement `prepare_trip`, other objects can interact with them _as if_ they were a `Preparer`.

Existence of `Preparer` suggests a prallel `Preparable` role. They come in pairs.

Trip class acts as a `Preparable`, because it implements the `Preparable` interface.
Preparable: something that can be prepared; it implements the interface that makes it preparable.

This interface includes all the messages that any `Preparer` might expect to send a `Preparable` (methods: bicycle, customers, vehicle...)

This is a simple example:
The `Preparable` role is entirely defined by its interface.
For something to play the role of `Preparable`, it just has to implement the interface.
They share the method signature, but no other code.

## Ruby Modules
More complex Roles not only share method signature, but also specific behavior.
This code needs to be defined in a single place, while being usable by any object that wishes to play this role.
In Ruby, these mix-ins are called _modules_.

Methods are defined in modules and can be added to any object.
These methods become available to the object via automatic delegation.

Create Duck Types -> put shared behavior into a module.

## Letting Objects Speak for Themselves
Extreme example of how __not__ to do it:
`StringUtils.empty?(some_string)`

`some_string` should be able to answer this questions.
You shouldn't have to know about a third-party class `StringUtils`, to get the answer.
Having to use `StringUtils` would be a dependancy that needs to be avoided.

## Extracting Abstraction into Modules
```ruby
  module Schedulable
    attr_writer :schedule

    def schedule
      @schedule ||= ::Schedule.new
    end

    def schedulable?(start_date, end_date)
      !scheduled?(start_date - lead_days, end_date)
    end

    def scheduled?
      schedule.scheduled?(self, start_date, end_date)
    end

    ## includers may override
    ## this is a hook that follows the Template Method pattern
    def lead_days
      0
    end
  end


  class Bicycle
    include Schedulable

    def lead_days
      1
    end

    # ...
  end

  class Vehicle
    include Schedulable

    def lead_days
      3
    end

    # ...
  end
```

## Use Duck Types for behaves-like-a Relationships
Some problems require many different objects to play a common role.
This includes roles like: `scheduleable`, `preparable`, `printable`, `persistable`...

There are two ways to recognize the existance of a role:
1. "Although an object plays it, the role is not the object's main responsibility"
- Example: [A bicycle behaves-like-a schedulable, but is-a bicycle](#finding-roles)
2. "When many otherwise unrelated objects share a desire to play the same role"
- Example: [Mechanic, TripCoordinator, Driver...](./duck-type.md#example-of-duck-type-preparer)

Think of roles from the outside: from the point of view of a _holder of a role_, rather than the _player_ of a role.
The holder of `schedulable` expects it to implement `Scheduleable`'s interface and to honor `Schedulable`'s contract.
Meaning that all _schedulables_ are alike in that they must meet these expectations.

Your task as a designer is to recognize that this role exists, define the interface of its duck type
and provie an implementation of that interface for every possible player.
Some roles consist of their interface, others share common behavior.
Define the common behavor in a Ruby module to allow objects to play the role without duplicating code.
