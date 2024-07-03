# OOD - Designing Cost Effective Tests
- see: [TDD - Test Driven Development](/pages/tdd-test-driven-development)
- see: [BDD - Behavior Driven Development](/pages/bdd-behavior-driven-development)

## Refactoring
- [Martin Fowler - Refactoring: Improving the Design of Existing Code](/pages/refactoring#martin-fowler---refactoring-improving-the-design-of-existing-code)

The art of changeable code requires the ability to write high-value tests.
Tests give confidence to refactor code constantly.
Good tests don't need to be rewritten when code gets refactored.

## Intentional Testing
Common arguments for having tests:
- reduction of bugs
- provide documentation
- writing tests _first_ improves application design

The true purpose of testing, just like the true purpose of design is __to reduce costs__.

## Know your intentions
Benefits of writing tests:

1. Finding Bugs
  - Finding faults and bugs early in development yields dividends.
  - It is easier to find and fix bugs nearer to the time of creation.
  - Getting the code _right_ earlier improves design.
  - Knowing that you can/can't do something early makes you choose alternatives in the present,
  rather than have limited options in the future
  - As code accumulates, embedded bugs acquire dependencies. Fixing bugs late in the process necessitates changing dependent code.
  - Fixing bugs early always lowers cost.
2. Supplying Documentation
  - Tests provide the only reliable documentation of design.
3. Deferring Design Decisions
  - Tests allow you to safely defer design decisions.
  - When you lack the information to make a design decision, you will temporarily write hardcoded _hacks_.
    At some point you will create an abstraction from the many concrete cases you have.
  - When tests depend on interfaces, you can refactor the underlying code to your heart's content.
  - Tests verify the continued good behavior of your application, while you continue to change the code.
  - Refactoring does not break tests!
  - Intentionally depending on interfaces allows you to use tests to put off making design decisions safely and without penalty.
4. Supporting Abstractions
  - When enough information finally arrives to support you making a design decision,
    you will change code in ways to increase its abstraction.
  - As abstractions grow, tests become necessary.
  - There is a level of abstraction where it is unsafe to make changes without relying on tests.
  - Tests are a record of the interface of every abstraction.
5. Exposing Design Flaws
  - Tests expose design flaws in the code.
  - If a test is too hard to set up, the code requires too much context.
  - If testing one object drags more objects into the mix, the code has too many dependencies.
  - If tests are hard to write, other objects will find the code difficult to use.
  - When a design is bad, testing is hard!

## Knowing What to Test
- Don't write too many tests!
- Have fewer of them and remove duplication.
- Think of objects as black boxes. Internals are not visible from the outside,
only a pre-defined set of messages can be passed through.
- Well-designed objects have strong bounderies. Nothing on the inside can see out, nor can the outside see in.
- Willful ignorance of the internals of every object is the core of design.
- Deal with objects as if they are only and exactly the messages to which they respond.
- Each test is merely another application object that needs to use an existing class.
- Do not couple tests tightly to classes! They musn't be forced to change. Tests should only interact with public interfaces.
- The public interface is the most stable part of any object. Test the messages defined in the public interface!
- "One object's outgoing message, is another object's incoming message".
- Never write tests that are coupled to unstable object internals (private classes).
- Tests should only concern themselves with the inbound and outbound messages.

> Incoming messages make up the public interface of the receiving object.
> The outgoing messages, by definition, are incoming into other objects and so are part of some other object's interface.

## Test state, queries, commands
```
Incoming    _______   Outgoing     Incoming   _______
---------> |       | ----------> | --------> |       |
           |  Foo  |                         |  Bar  |
---------> |_______| ----------> | --------> |_______|
```

A message sent by `Foo` to `Bar` is outgoing from `Foo` and incoming to `Bar`.
This message is part of `Bar`s public interface, and all tests of __state__ should should be confined to `Bar`.
`Foo` need not and should not test these outgoing messages for state!

1. __state__: Objects should make assertions about _state_ only of incoming messages to their public interface.
Tests that make assertions about the values that messages return are tests of __state__.

2. __queries__: Some outgoing messages have no side effect and matter only to their senders.
The sender is the only one that cares about these messages (why else would it send them?), but they do not affect the application.
These messages should not be tested by the sender. They are known as __queries__.
Query messages are part of the public interface of the receiver, which already implements every necessary test of state.
See: [Ignoring Query Messages in Testing](#ignoring-query-messages-during-tests)

3. __commands__: Some outgoing messages do have side effects:
A file gets written, a database record is saved, an action is taken by an observer...
The application depends on these effects.
These messages are __commands__ and it is the responsibility of the sending object to test if they are properly sent.

Rules:
- Incoming messages should be tested for the state they return.
- Outgoing query messages should not be tested.
- Outgoing command messages should be tested to ensure they get sent.

The application should be architected to only rely on messages being sent.
Tests should be written only for these public interfaces.
This makes tests tolerant of internal changes made to objects, the public interface remains stable.

## Knowing When to Test
Tests should be written first, when it makes sense to do so.
Novices write code that is tightly coupled, which makes retroactively writing testing difficult.
Since tests should be reusable, the code must be reusable as well.

> Writing tests first, forces design decisions that create objects that can be tested in isolation.

## Knowing How to Test
Popular testing frameworks:
- [MiniTest](https://github.com/minitest/minitest) - comes bundled since Ruby 1.9
- [RSpec](https://rspec.info/)

Testing philosophies:
- [TDD - Test Driven Development](/pages/tdd-test-driven-development) "inside-out"
- [BDD - Behavior Driven Development](/pages/bdd-behavior-driven-development) "outside-in"

## Deleting Unused Interfaces
- Incoming messages ought to have dependents.
- Do not test incoming messages that do not have dependents, delete them.
- Eliminate unused code, this lowers costs.

## Proving the Public Interface / Unit Test Example
- Incoming messages are tested by making assertions about their value, their state, that invocation returns.
- The first requirement for testing an incoming message is to prove that it returns the correct value every possible time.
- see: [Unit Testing](/pages/unit-testing)

A test of `Wheel.diameter` method from [Managing Dependencies](/pages/ood-managing-dependencies):

```ruby
class WheelTest < MiniTest::Unit::TestCase

  def test_calculates_diameter
    wheel = Wheel.new(26, 1.5) # creates instance of Wheel

    assert_in_delta(29,        # asserts that this instance of Wheel has diameter of 29
                    wheel.diameter,
                    0.01)
  end
end
```
Wheel has no hidden dependencies, so no other application object gets created as a side effect of running the test.
Wheel's design allows you to test independently of every other class in the application.
This is important, becasue a long runtime incurs extra cost.
Tests run long when other dependencies are invoked: if an object creates another object.

## Isolating the Object Under Test
When you can't test an object in isolation, it exposes a design flaw.
Refactoring for Dependency Injection (DI) leads to decoupling, making it easier to test

## Injecting Dependencies Using Classes
Test should use the same collaborating objects as the code in the application. Test will break when they should!

## Creating Test Doubles
- part of: [BDD](/pages/bdd-behavior-driven-development)

A fake object is a _test double_.
A test double is a stylized instance of a role player that is used exclusively for testing.
Doubles are easy to make and you can create them for every possible situation.

This double _stubs_ a diameter and returns returns a canned answer:

```ruby
class DiameterDouble
  def diameter
    10
  end
end

class GearTest < MiniTest::Unit::TestCase
  def test_calculates_gear_inches
    gear = Gear.new(
        chainring: 52,
        cog:       11,
        wheel:     DiameterDouble.new
    )

    assert_in_delta(47.27,
                    gear.gear_inches,
                    0.01)
  end
end
```

- __WARNING:__ Stubbing and mocking makes for brittle tests that pass even when the application is obviously broken.
- DiameterDouble is not a [mock](/pages/tdd-test-driven-development#mocks--mocking)!

## Using Tests to Document Roles
- Forgetting what roles _doubles_ play in test is inevitable.
- Test names serve as documentation for roles and prove that interfaces are implemented correctly.

```ruby
class WheelTest < MiniTest::Unit::TestCase
  def setup
    @wheel = Wheel.new(26,1.5)
  end

  def test_implements_the_diameterizable_interface
    assert_respond_to(@wheel, :diameter)
  end

  def test_calculates_diameter
    @wheel = Wheel.new(26,1.5)

    assert_in_delta(29,
                    wheel.diameter,
                    0.01)
  end
end
```

## Ignoring Private Methods During Tests
- Private methods are invoked by public methods _that already have tests_.
- A bug in a private method can break the application, but this is exposed in existing tests of public methods.
- Private methods change frequently with refactoring, writing tests is a waste of time.

## Removing Private Methods from the Class Under Test
An object with many private method calls exudes the design smell of having too many responsibilities.
You may extract these methods into a new object, but this does not guarantee that the new object will have a stable interface.
It is costly to couple to unstable methods, be they public or private.

## Ignoring Query Messages During Tests
- see: [Test state, queries, commands](#test-state-queries-commands)
Messages that have no side effect are known as _query_ messages.

Example of `grear_inches` sending `diameter`:

```ruby
class Gear
  # ...
  def gear_inches
    ratio * wheel.diameter
  end
end
```

This is an _outgoing_ _query_ message. It has no effect on the application, it merely responds with a value.
It should not be tested by the sending object.
It is part of the interface of the receiving object, where tests are implemented.

## Proving Command Messages
