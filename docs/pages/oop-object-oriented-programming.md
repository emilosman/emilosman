# OOP Object Oriented Programming
- [Matthias Noback - Object Design Style Guide](https://www.manning.com/books/object-design-style-guide) (36/418)

## static vs dynamic types in programming
- programming languages use the term "type" to describe the category of the contents of a variable. (strings, numbers, arrays...)
- in statically typed languages you must declare the type of each variable and every method parameter
- in dynamically typed languages omit this requirement
- dynamic types make metaprogramming easier
- metaprogramming: writing code that writes code

## instance vs static methods
```c#
class Foo
{
    public function anObjectMethod(): void
    {
        // ...
    }

    public static function aStaticMethod(): void
    {
        // ...
    }
}

object1 = new Foo();
object1.anObjectMethod();    //1
 
Foo.aStaticMethod();         //2
```

1. anObjectMethod() can only be called on an instance of SomeClass.
2. aStaticMethod() can be called without an instance.

## ruby class methods = public static method
- [Class and Instance Methods in Ruby](http://www.railstips.org/blog/archives/2009/05/11/class-and-instance-methods-in-ruby/)

## constructor
- constructor (initialize in Ruby) is a special method that 'prepares' the object before it will be used

## factory
- the standard way to instantiate a new instance of a class is by using the _new_ operator: `object1 = new Foo();`
- you can also define a static _factory_ method that returns a new instance of the class:
- Ruby: an object that manufactures objects. See [Factory (composition)](./ood-composition.md#factory-composition)

```c#
    class Foo
    {
        public static function create(): Foo
        {
            return new Foo();
        }
    }

    object1 = Foo.create();
    object2 = Foo.create();
```

## state
An object can contain data.
This data will be stored in _properties_.
A property will have a _name_ and a _type_, and it can be populated at any moment after instantiation.
A common place for assigning values to properties is inside the constructor.

```c#
class Foo
{
    private int someNumber;
    private string someString;

    public function __construct()
    {
        this.someNumber = 10;
        this.someString = 'Hello, world!';
    }
}

object1 = Foo.create();
```

## constants vs public property
- `public const` if data is going to be hardcoded and not changing, it should be defined as a _constant_
- `public string` can be changed, it is not a constant

```c#
    class Foo {
        public const int someNumber;
        public string someString;
    }
```

## private vs public scope
In general _private_ should be the default scope.
