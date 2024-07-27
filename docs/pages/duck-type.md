# Duck Type
- part of [OOD](/pages/ood-object-oriented-design.md#duck-type)
- see: [Roles and Modules](/pages/ood-roles-modules.md)

Messages are the center of object-oriented applications and they pass among object along public interfaces.
Duck typing detaches these public interfaces from specific classes,
creating virtual types that are defined by what they do instead of who they are.

Duck typing reveals underlying abstractions that might othervise be invisible.
Depending on abstractions reduces the risk and increases flexibility,
making applications cheaper to maintain and easier to change.

- don't depend on classes, depend on messages
- duck typing: messages + public interfaces
- public interfaces not tied to a specific class
- duck typed objects are more defined by their behavior than by their class
- duck types replace dependencies on class with dependencies on messages.
- "If it walks like a duck, quacks like a duck, it's class is immaterial, it's a duck."

## Example of duck type `Preparer`
- see: [Roles](/pages/ood-roles-modules.md#finding-roles)

```ruby
class Trip
  attr_reader :bicycles, :customer, :vehicle

  def prepare(preparers)
    preparers.each {|preparer|
      preparer.preapare_trip(self)
    }
  end
end

class Mechanic
  def prepare_trip(trip)
    trip.bicycles.each {|bicycle|
      prepare_bicycle(bicycle) }
  end

  # ...
end

class TripCoordinator
  def prepare_trip(trip)
    buy_food(trip.customers)
  end

  # ...
end
```

## Consequences of duck typing: Concrete vs abstract code
- concrete code is dependency laden, but may be easier to understand
- abstract duck typed code may require more obscure ("Preparer"...) but far easier to change!
- good design: object defined by their behavior, rather than by their class

## Writing Code that Relies on Ducks
Duck types are easy to implement, but the challenge is to recognize the patterns where they can be substituted

## Recognizing Hidden Ducks
Duck types can be implemented instead of these:
1. Case statements that switch on class
2. `kind_of?` or `is_a?`
3. `responds_to?`

### 1. Case statements that switch on class
Ask yourself what does `prepare` want from each of its arguments?
The answer to that message is the message you should send.
The _message_ defines the duck type.

```ruby

def prepare(preparers)
  preparers.each {|preparer|
    case preparer
    when Mechanic
      preparer.prepare_bicycles(bicycles)
    when TripCoordinator
      preparer.buy_food(customers)
    when Driver
      preparer.gas_up(vehicle)
    end
  }
```

The `prepare` method wants its arguments to _prepare_ the trip.
Thus, the `prepare_trip` method becomes the _public interface_ of the `Preparer` duck.

### 2. kind_of? or is_a?
- `kind_of?` and `is_a?` are synonims for checking class
- it's the same as the case switch example previous
- don't be fooled by the removal of explicit class references, this code still expects specific classes.
- rewrite this using ducks!

```ruby
  if preparer.kind_of?(Mechanic)
    # ...
  elsif preparer.kind_of?(TripCoordinator)
    # ...
  elsif preparer.kind_of?(Driver)
    # ...
  end
```

### 3. responds_to?
- `responds_to?` checks for methods, instead of Class names.
- this is a trap to avoid, the inverse of the previous examples
- you must trust your objects to respond correctly instead of asking them!
- still needs to be a duck!

```ruby
  if preparer.responds_to?(:prepare_bicycles)
    # ...
  elsif preparer.responds_to?(:buy_food)
    # ...
  elsif preparer.responds_to?(:gas_up)
    # ...
  end
```

## Placing Trust in Your Ducks
- do not interrogate your objects, you must trust them to behave correctly
- trust is the essence of OOD

## Documenting Duck Types
- duck types are more abstract and opaque, difficult to understand what they do
- the _public interface_ and _tests_ serve as the documentation!

## Sharing Code Betweed Ducks
- the ducks in the above example only have the _name_ of the method they implement in common
- they have different behaviour, specific to their class
- they only have the _interface_ in common
- frequently the ducks that implement these interfaces need to share behaviour (they need to share code!)

## When is it OK to not use Duck Types?
- there are situations where it is OK to check the class of an object
- if those classes are Ruby base classes like Integer or Hash, these will never change in a breaking way
- duck types protect you from unstable dependencies

## Duck Types vs Static Typing
- [see static vs dynamic types in OOP](/pages/oop-object-oriented-programming.md#static-vs-dynamic-types-in-programming)
- in statically typed languages you must declare the type of the method parameter, making duck typing impossible
