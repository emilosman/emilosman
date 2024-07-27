# Composition
- part of [OOD](./ood-object-oriented-design.md#combining-objects-with-composition)
- see: [Roles and Modules](./ood-roles-modules.md)

Compositino allows you to combine small parts to create more complex objects,
such that the whole becomes more than the sum of its parts.

Composed objects tend to consist of simple, discrete entities that can be easily arranged into new combinations.

## Combining Objects With Composition
Composition is the act of combining disctinct parts into a complex whole,
such that the whole becomes more than the sum of its parts.

- Object-oriented composition combines simple, independent objects into a larger, more complex whole.
- In composition, the larger object is connected to its parts via a __has-a__ relationship.
- The larger object contains within it its parts.
- The larger object communicates with its parts via an interface.
- Parts play _roles_ and the containing object collaborates with them.

## Replacing Inheritance with Composition
- [see Acquiring Behavior through Inheritance](./ood-inheritance.md#acquiring-behavior-through-inheritance)

Example:
- A `Bicycle` has-a `Parts`
- Bicycle ->(1) Parts
- `Parts` represents a collection of parts, not a single part
- A `Bicycle` is composed of `Parts`

DI example:
```ruby
class Bicycle
  attr_reader :size, :parts

  def initialize(args={})
    @size = args[:size]
    @parts = args[:parts]
  end

  def spares
    parts.spares
  end
end
```
`Bicycle` is responsible for knowing its `size`, holding onto its `Parts` and answering to `spares`.

See page 166 for example of code being moved from larger, containing object to separate parts.

## Creating Hierarchy with Composition
Example: `Bicycle` holds one `Parts` object, which in turn holds many `Part` objects.

```ruby
class Bicycle
  attr_reader :size, :parts

  def initialize(args={})
    @size = args[:size]
    @parts = args[:parts]
  end

  def spares
    parts.spares
  end
end

class Parts
  attr_reader :parts

  def initialize(parts)
    @parts = parts
  end

  def spares
    parts.select {|part| part.needs_spare}
  end
end

class Part
  attr_reader :name, :description, :needs_spare

  def initialize(args)
    @name = args[:name]
    @description = args[:description]
    @needs_spare = args.fetch(:needs_spare, true)
  end
end

chain =
  Part.new(name:'chain', descritption: '10-speed')
road_tire =
  Part.new(name:'tire_size', descritption: '23')
tape =
  Part.new(name:'tape_color', descritption: 'red')

road_bike =
  Bicycle.new(
    size: 'L',
    parts: Parts.new(
      [chain,
      road_tire,
      tape
      ]
    )
  )

road_bike.spares # returns an array of Part objects now!
                 # but they don't necessarily have to be Part class objects,
                 # composition tells us that they only need to play the role of a Part object
```

- `road_bike.spares` returns an array of objects
- `road_bike.parts`  returns an instance of parts

## Enumerable
To get Parts to act more like an array, you can make it an `Enumerable`.
```ruby
require 'forwardable'
class Parts
  extend Forwardable
  def_delegators :@parts, :size, :each
  include Enumerable

  def initialize(parts)
    @parts = parts
  end

  def spares
    parts.select {|part| part.needs_spare}
  end
end
```
Now you have access to Array methods like `size`, `each`.
This will now work: `road_bike.parts.size` returning the number of elements. Before it would have resulted in a NoMethodError
It still gives NoMethodError for trying to concat it like an Array with `+`, but it is a compromise.

## Factory (composition)
Creating objects with config using a 2D array:
1. column: description
2. column: value
3. column: optional boolean value

```ruby
mountain_config =
  [['chain',       '10 speed'],
   ['tire_size',   '2.1'],
   ['front_shock', 'Manitou', false],
   ['rear_shock',  'Fox']
  ]

# Creates Parts objects
module PartsFactory
  def self.build(config,
                 part_class = Part      # default
                 parts_class = Parts)   # default

    parts_class.new(
      config.collect {|parts_config|
        part_class.new(
          name:        part_config[0],
          description: part_config[1],
          needs_spare: part_config.fetch(2, true) # defaults to true
        )
      }
    )
  end
end

mountain_parts = PartsFactory.build(mountain_config)
```

Config can now be given as an array, rather than a hash.
PartsFactory contains the knowledge of config's structure, making it easy to write config.
Now PartsFactory isolates the knowledge needed to create Parts.
This forces you to use the factory, and avoids duplication of creation code.

## OpenStruct
When a class is very simple, like `Part` it can be refactored as an OpenStruct.

This class can be refactored:

```ruby
class Part
  attr_reader :name, :description, :needs_spare

  def initialize(args)
    @name = args[:name]
    @description = args[:description]
    @needs_spare = args.fetch(:needs_spare, true)
  end
end
```

as OpenStruct:

```ruby
require 'ostruct'
module PartsFactory
  def self.build(config, parts_class = Parts)
    parts_class.new(
      config.collect {|part_config| create_part(part_config) }
    )
  end

  def self.create_part(part_config)
    OpenStruct.new(
      name:        part_config[0],
      description: part_config[1],
      needs_spare: part_config.fetch(2, true) # defaults to true
    )
  end
end
```

- By eliminating the `Part` class, you can ONLY use PartsFactory to create Parts.
- Note: Parts created with OpenStruct are OpenStruct objects.

# The Composed Bicycle
- See page 180 for example of full refactor using composition.

Creation of a new bicycle using a factory for parts:

```ruby
mountain_config =
  [['chain',       '10 speed'],
   ['tire_size',   '2.1'],
   ['front_shock', 'Manitou', false],
   ['rear_shock',  'Fox']
  ]

mountain_bike = Bicycle.new(
  size: 'L',
  parts: PartsFactory.build(mountain_config)
)
```

## Aggregation: A Special Kind of Composition
1. Delegation: when one object receives a message and forwards it to another.
- Delegation creates dependencies; the receiving object must recognize the message _and_ know where to send it.

2. Composition: involves delegation, but means something more.
- A _composed_ object is made up of parts with which it expects to interact with via well-defined interfaces.
- Composition describes a _has-a_ relationship
- Bicycles (composed objects) have Parts (roles)
- The composed object relies on the interface of the role.
- Unanticipated objects fit in seamlessly and interchangeably when they play a role by implementing the correct interface.
- In Composition, the __has-a__ relationship requires that the object playing a _role_ has no life independent of its container.
- Once the composed object is gone, its contained objects are gone too.

3. Aggregation: Same as composition, but the contained object can exist independent of a composed object.

## Accepting the Consequences of Composition
Objects built with composition differ in two basic ways from those built with inheritance.
Composed objects do not depend on the structure of class hierarchy, they delegate their own messages.
These differences confer different set costs and benefits.

## Benefits of Composition
When using composition, the natural tendency is to create small objects that contain straightforward responsibilities
that are accessible through clearly defined interfaces.

Small objects have a single responsibility and specify their own behavior.
They are _transparent_. The code is easy to understand and it's clear what will happen when it changes.

The composed object's independance from hierarchy means that it inherits little code,
and so is generally immune from suffering side-effects as a result of changes made to classes above it in hierarchy.

Because composed objects deal with their parts via an interface, adding a new of part
is a simple matter of plugging in a new object that honors that interface.
From the point of view of an existing object, adding a new variant of an existing object is _reasonable_ and requires no changes in code.

By their very nature, composed objects are small, structurally independent, and have well-defined interfaces.
This allows their seamless transition into pluggable, interchangeable components.
Well-composed objects are therefore easily _usable_ in new and unexpected contexts.

At its best, composition results in applications built of simple, pluggable objects that are easy to extend and have a high tolerance for change.

## Costs of Composition
A composed object relies on many parts.
Even if those parts are easy to understand individually, the complete operation as a whole may be less than obvious.
Even if each part is _transparent_, the whole may not be.

Benefits of structural independence come at the cost of _automatic message delegation_.
Composed objects must know which messages to delegate and to whome.
Identical delegation may be needed for many different objects. There is no way to share this code.

Composition is exellent at prescribing the rules for assembling an object made of parts,
but does not provide as much help for the problem of arranging code for a collection of parts
that are very nearly identical.

## Use Composition for has-a Relationships
Many objects conain numerous parts, but are more than the sum of their parts.
`Bicycles` have-a `Parts`, but behave like something more.
It has behavor that is separate from and in addition to the behavor of its parts.
Given its current behavior model it as composition.

