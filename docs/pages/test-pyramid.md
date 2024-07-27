# Test Pyramid
- [x] [Ham Vocke - The Practical Test Pyramid](https://martinfowler.com/articles/practical-test-pyramid.html)
- [Sample Spring application](https://github.com/hamvocke/spring-testing)

1. [End-to-End Tests](#end-to-end-tests) + [UI Tests](#ui-tests)
2. [Integration Tests](#integration-tests) + [Contract Tests](#contract-tests)
3. [Unit Tests](#unit-test)

The "Test Pyramid" is a metaphor that groups software tests into buckets of different granularity.

Production-ready software requires testing before it gets deployed.
Instead of manual software testers, development teams now use automated testing.
This increases speed of delivery and reduces cost.
The shortened feedback loop of automated testing goes hand in hand with Agile, Continuous Delivery and DevOps culture.

## The Importance of Test Automation
- see: [DevOps](./devops.md)
- see: [CI/CD](./ci-cd.md)

As the amount and sophistication of software grows, software must be delivered faster, without sacrificing quality.

[Continuous Delivery](./ci-cd.md#continuous-delivery) allows you to deliver software to production at any time.
CD uses a __build pipline__ to automatically test software and deploy it to _testing_ and _production_ environments.

Doing all of this manually is impossible, as it requires manual repetative work.
Automating everything from tests, deployment and infrastructure is the only way forward.

Steps of a _build pipeline_:
1. build
2. test
3. provide infrastructure
4. deploy
5. test more

Traditional software testing relies on overly manual work.
The application would be deployed to a test environment, with QAs performing black-box style testing of clicking through the user interface to see if anything is broken.
QAs would follow a test script, ensuring consistent checking.
This is time-consuming, repetative and tedious, leading to mistakes.

The remedy for repetative tasks is _automation_.
Automated tests make large-scale refactoring possible.

## Parts of the Test Pyramid
1. __End-to-End Tests__: very few high-level tests
2. __Integration Tests__: some coarse-grained tests
3. __Unit Tests__: lots of small and fast unit tests

Rules of the test pyramid:
- write tests with different granularity
- the more high-level you get the fewer tests you should have

## Unit Test
The foundation of your test suite is made up of [unit tests](./unit-testing.md).
A unit test makes sure that a certain unit (subject under test) of your codebase functions as intended.
Unit tests have the narrowest scope of all the tests in your test suite.
The number of unit tests will largely outnumber any other type of test.

In functional programming a unit will most likely be a single function.
In OOP it can range from a single method to an entire class.

## Sociable and Solitary Unit Tests
- see: [Mocks / Mocking](./tdd-test-driven-development.md#mocks--mocking)
- coined by: [Jay Fields - Working Effectively with Unit Tests](https://leanpub.com/wewut)

Some argue that all collaborators (e.g. other classes that are called by your class under test)
of your subject under test should be substituted with _mocks and stubs_,
to come up with perfect isolation to avoid side-effects and complicated test setup.

Others argue that only collaborators that are slow or have bigger side-effects
(e.g. classes that access databases or make network calls) should be stubbed or mocked.

- __solitary unit tests__: tests that stub all collaborators
- __sociable unit tests__: tests that allow talking to real collaborators

## Mocking and Stubbing
- see: TDD [Mocks / Mocking](./tdd-test-driven-development.md#mocks--mocking)

_Mocks_ and _Stubs_ are two different kinds of [Test Doubles](./bdd-behavior-driven-development.md#doubles--stubs--stubbing).
Doubles are used to replace objects used in production with an implementation that helps testing.

Doubles replace real classes and modules with objects that answer the same method calls,
with _canned_ responses defined at the beginning of a unit tests.

Doubles are not specific to unit testing, as more elaborate doubles can be created that simulate
entire parts of a system in a controlled way.
They are frequently encountered in unit testing, as testing frameworks make creating them easy.

## Testing Private Methods
- see: [OOD: Ignoring Private Methods During Tests](./ood-designing-cost-effective-tests.md#ignoring-private-methods-during-tests)

You shouldn't test private methods!
They are indicative of a design problem, rather than a scoping problem.
Classes that are too complex violate the [Single Responsibility Principle](./solid.md#s---single-responsiblity-principle), the S from [SOLID](./solid.md).

The solution is to split the class and move the private method you wish to test to the public interface of a new class.

## What to Test?
- see: [OOD: Knowing What to Test](./ood-designing-cost-effective-tests.md#knowing-what-to-test)

Rules:
- One test class per production class.
- Test only the public interface of a class.

## Test Structure
1. Set up the test data
2. Call methods under test
3. Assert that the expected results are returned

Other mnemonics to remember, taken from [BDD - Behavior Driven Development](./bdd-behavior-driven-development.md):
- "Arrange, Act, Assert"
- "Given, When, Then"

This pattern can be applied to high-level tests as well, not only to unit tests.

## Implementing a Unit Test
- see: [Unit Test](./unit-testing.md)

## Integration Tests
All non-trivial applications integrate with databases, filesystems, network calls to applications, etc.
This means that these services need to run alongside your application.

_Integration tests_ can replace separate services and databases with _doubles_, or run spin up of them.

Example of a database integration test:
1. start a database
2. connect application to database
3. trigger a function within the code that writes data to the database
4. check that the expected data has been written to the database, by reading the data from the database

Example of integrating an outside services via a REST API:
1. start application
2. start instance of the separate service (or a test double with the same interface)
3. trigger a function that reads from the separate service's API
4. check that the application can correctly parse the response

Examples when _serializing and deserializing_ data:
- calls to a service's REST API
- reading and writig from databases
- calling other application's APIs
- reading and writing from queues
- writing to the filesystem

These serialization tests ensure that writing and reading data with external collaborators works fine.

## Brittle Integration Tests
When we _mock_ and create a fake service in place of a real one to test if we can parse a response correctly,
we create _brittle_ tests. We can't guarantee that our fake service behaves like the real one.

The real service could change its API - our tests would still pass, while production breaks.

End-to-End tests __interact with a test instance of a real services__ but require the availability of that test service.

A solution to this dilemma are __contract tests__:
They run against the fake and real version of the service
to ensure that the fake in our integration tests is a faithful test double.

## Contract Tests
_Contracts_ clearly specify the interface of services you integrate with.

[Microservices architecture](./microservice-architecture.md) requires you to interact with many
different services using APIs, commonly using one of the following:
- REST and JSON via HTTPS
- [RPC -Remote Procedure Call](./rpc-remote-procedure-call.md) using something like gRPC
- event-driven architecture using queues

Here, a _consumer_ and a _provider_ communicate via API.

[Automated contract tests](https://martinfowler.com/bliki/ContractTest.html) make sure that the implementations on the consumer and provider side stick to the defined contract.
They serve as a good regression test suite and make sure that deviations from the contract will be noticed early.

## Consumer-Driven Contract Tests (CDC Tests)
Let the consumers drive the implementation of a contract:
- Using CDC, consumers of an interface write tests that check the interface for all data they need from that interface.
- The _consuming team_ then publishes these tests so that the _publishing team_ can fetch and execute these tests easily.
- The providing team can now develop their API by running the CDC tests.
- Once all tests pass they know they have implemented everything the consuming team needs.

> Consumer _writes and publishes_ the Executable Tests, the Provider _fetches and executes_ the Executable Test.

CDC tests keep teams autonomous.

Tools that help with writing and exchanging CDC tests
- [pact](https://github.com/pact-foundation/pact-ruby)

## UI Tests
UI tests ensure that the interface of the application works correctly.

When performing an End-To-End test, the UI is tested as well,
but UI tests are not all encompassing End-To-End tests.
A UI test could be as simple as writing some JavaScript unit tests
and stubbing out the backend.

[Selenium](https://www.selenium.dev/documentation/webdriver/) can be used to automate frontend tests.

## End-To-End Tests
End-To-End tests test the entire, complete integrated system.
Webdriver driven UI tests are a good example of End-To-End tests.
These automated tests drive a headless browser, performing clicks, entering data, etc.

End-To-End tests are notoriously flaky and fail for unforeseeable reasons. Often thair failure is a false positve.
The more complex the UI, the harder it is to test.
Quirks in browsers exacerbate these problems.

Microservices also raise the question of who is responsible for writing these tests.
See: [Centralised QA Team As Antipattern](./qa.md#centralised-qa-team-as-antipattern)

End-To-End tests requier a lot of maintenance and run slow.

Since these tests are expensive to run, you should have the smallest number of them in the Test Pyramid.
The lower level tests should cover edge cases.

Write End-To-End tests only for the most valuable and important user interactions.

## Subcutaneous Tests / REST API End-to-End Tests
Avoiding the UI and testing the REST API in End-To-End tests produces less flaky results.
These are called [Subcutaneous  Tests](https://martinfowler.com/bliki/SubcutaneousTest.html)

## Acceptance Tests - Do Your Features Work Correctly?
Tests that make sure things work from a user's perspective are called
__functional test__ or __acceptance tests__.

This falls under [BDD - Behavior Driven Development](./bdd-behavior-driven-development.md), where you can use tools like
[Cucumber](https://cucumber.io/)

## Exploratory Testing
- [wiki](https://en.wikipedia.org/wiki/Exploratory_testing)

Even the most diligent test automation efforts miss certain edge cases.
Some bugs are impossible to detect with unit tests.
Certain quality issues may not be apparent within automated tests (like _design_ or _usability_).
Despite best intentions regarding to test automation, manual testing is still a good idea.

Exploratory Testing emphasises the tester's freedom to dick around and find bugs.

The bugs you find through exploratory testing can be later covered with automated tests.

## Putting Tests Into a Deployment Pipeline
Tests should run in [Deployment Pipelines](./ci-cd.md#deployment-pipeline), as part of [CI/CD](./ci-cd.md).
These pipelines are split into several stages that ensure software is ready to be deployed to production.

Tests should be placed in the deployment pipeline
following one of the core tenets of [Extreme Programming](http://www.extremeprogramming.org/values.html) and Agile: __Fast Feeback__.

A good pipeline detects problems fast:
- put fast running tests up front
- longer running tests with broader scope at the later stages of the deploy process

## Avoid Test Duplication
Avoid test duplication at all cost:
1. If a higher-level test spots an error and there's no lower-level test failing, write a lower-level test
2. Push tests as far down the test pyramid as possible

These rules increase the speed of the test suite.
