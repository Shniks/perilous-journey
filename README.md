---
Project Title: Perilous Journey
Data Structure: Linked List
Author: Nikhil Shahi
Date: August 7, 2022
Test Framework: RSpec
Test Coverage: 100%
---

Overview
========

In this project we’re going to build a wagon train heading West over the treacherous Rocky Mountains. Can your party survive the journey??

However to add some additional depth, let’s also use this project as a chance to explore one of the fundamental data structures in computer science – the Linked List.

### Oregon Trail 101

The Oregon Trail is one of the original computer games, created in 1971. It was originally designed to teach school children about 19th century pioneer life, but quickly became a cult classic. The player assumes the role of a wagon leader guiding their party from Independence, Missouri to the Wilamette Valley in Oregon via a wagon train in 1848. Due to the rampant amount of untreated disease and treacherous conditions of the rugged terrain, death was frequent. Thus, the main purpose was to survive, and to do so, each wagon family had to maintain supplies. They collected everything from oxen, food and clothing to ammunition and spare parts.

Linked Lists
------------

Linked Lists are one of the most fundamental Computer Science data structures. A Linked List models a collection of data as a series of “nodes” which link to one another in a chain.

In a singly-linked list (the type we will be building) you have a head, which is a node representing the “start” of the list, and subsequent nodes which make up the remainder of the list.

The list itself can hold a reference to one thing – the head node.

Each node can hold a single element of data and a link to the next node in the list.

The last node of the list is often called its tail.

Using sweet ASCII art, it might look like this:

```

List -- (head) --> ["hello" | -]-- (link) --> ["world" | -]-- (link) --> ["!" | ]

```

The three nodes here hold the data “hello”, “world”, and “!”. The first two nodes have links which point to other nodes. The last node, holding the data “!”, has no reference in the link spot. This signifies that it is the end of the list.

In other lower level languages, something called a pointer is what is used to ensure that a single link knows about the next link. In Ruby, we don’t use pointers, so the link is literally its node. When we get to a node which is the last node, we call it the tail, and its link is nil.

A linked list should be able to do the following:

- Insert elements  
- Pop an element from the end  
- Push an element onto the beginning  
- Remove the (first occurance	all occurances) of an element by data content  
- Remove an element by position  
- Add an element at an arbitrary position  
- Add an element after a known node  
- Find whether a data element is or is not in the list  
- Find the distance between two nodes

## Iteration 0 - Node Basics

Our Linked List will ultimately be composed of individual nodes, so in this iteration we’ll start with building out these nodes. Note that they are quite simple – a Node simply needs to have a slot for some data and a slot for a “next node”. Eventually this next_node position will be what we use to link the multiple nodes together to form the list.

For this iteration, build a simple node class that can perform these functions:

```ruby
> require "./lib/node"
> node = Node.new("Burke")
=> <Node @surname="Burke" @next_node=nil #5678904567890>
> node.surname
=> "Burke"
> node.next_node
=> nil
```


## Iteration 1 - Append, To String, and Count (Single Node / Element)

Great! We have nodes. In this iteration we’ll create the LinkedList class and start filling in the basic functionality needed to append our first node.

We’ll be adding the following methods:

- append - adds a new piece of data (data can really be anything) to the list
- count - tells us how many things are in the list
- to_string - generates a string of all the elements in the list, separated by spaces

But for now, focus on building these functions so they work for just the first element of data appended to the list (we’ll handle multiple elements in the next iteration).

Expected behavior:

```ruby
> require "./lib/linked_list"
> list = LinkedList.new
=> <LinkedList @head=nil #45678904567>
> list.head
=> nil
> list.append("West")
=> <Node @surname="West" @next_node=nil #5678904567890>
> list
=> <LinkedList @head=<Node @surname="West" ... > #45678904567>
> list.head.next_node
=> nil
> list.count
=> 1
> list.to_string
=> "The West family"
```

## Iteration 2 - Append, All/To String and Insert (Multiple Nodes)

Now that we can insert the first element of our list (i.e. the Head), let’s focus on supporting these operations for multiple elements in the list.

This iteration is really where we’ll build out the core structure that makes up our linked list – it will probably take you more time than the previous iterations.

Update your `append`, `count`, and `to_s` methods to support the following interaction pattern:

```ruby
> require "./lib/linked_list"
> list = LinkedList.new
=> <LinkedList @head=nil #45678904567>
> list.head
=> nil
> list.append("Rhodes")
=> => <Node @surname="Rhodes" @next_node=nil #5678904567890>
> list
=> <LinkedList @head=<Node @surname="Rhodes" ... > #45678904567>
> list.head
=> <Node @surname="Rhodes" @next_node=nil #5678904567890>
> list.head.next_node
=> nil
> list.append("Hardy")
=> => <Node @surname="Hardy" @next_node=nil #5678904567890>
> list.head.next_node
=> <Node @surname="Hardy" @next_node=nil #5678904567890>
> list.count
=> 2
> list.to_string
=> "The Rhodes family, followed by the Hardy family"
=> "doop deep"
```

Notice the key point here – the first piece of data we append becomes the Head, while the second becomes the Next Node of that (Head) node.

## Iteration 3 - Additional Methods - ```insert``` and ```prepend```

Now we have nodes and a LinkedList class that manages the list. Next step is to add the ```insert``` and ```prepend``` methods.

`prepend` will add nodes to the beginning of the list.

`insert` will insert one or more elements at a given position in the list. It takes two parameters, the first one is the position at which to insert nodes, the second parameter is the string of data to be inserted.

Expected behavior:

```ruby
> require "./lib/linked_list"
> list = LinkedList.new
> list.append("Brooks")
=> <Node @surname="Brooks" @next_node=nil #5678904567890>
> list.to_string
=> "The Brooks family"
> list.append("Henderson")
=> <Node @surname="Henderson" @next_node=nil #5678904567890>
> list.prepend("McKinney")
=> <Node @surname="McKinney" @next_node=<Node @surname="Brooks" ... > #5678904567890>
> list.to_string
=> "The McKinney family, followed by the Brooks family, followed by the Henderson family"
> list.count
=> 3
> list.insert(1, "Lawson")
=> <Node @surname="Lawson" @next_node=<Node @surname="Brooks" ... > #5678904567890>
> list.to_string
=> "The McKinney family, followed by the Lawson family, followed by the Brooks family, followed by the Henderson family"
```

## Iteration 4 - Additional Methods - `find`, `pop`, `includes?`

Perfect, we are almost there! Next is to add `find`, `pop` and `includes?` methods.

`find` takes two parameters, the first indicates the first position to return and the second parameter specifies how many elements to return.

`includes?` gives back true or false whether the supplied value is in the list.

`pop` removes elements the last element from the list.

Expected behavior:

```ruby
....
> list.to_string
=> "The McKinney family, followed by the Lawson family, followed by the Brooks family, followed by the Henderson family"
> list.find(2, 1)
=> "The Brooks family"
> list.find(1, 3)
=> "The Lawson family, followed by the Brooks family, followed by the Henderson family"
> list.includes?("Brooks")
=> true
> list.includes?("Chapman")
=> false
> list.pop
The Henderson family has died of dysentery
=> <Node surname="Henderson" next_node=nil #5678904567890>
> list.pop
The Brooks family has died of dysentery
=> <Node surname="Brooks" next_node=nil #5678904567890>
> list.to_string
=> "The McKinney family, followed by the Lawson family"
```

## Iteration 5 - Creating the WagonTrain Linked List “Wrapper”

Awesome! We have built most of our program and now it’s time to wrap the Linked List logic in a `WagonTrain` class.

When we create a new instance of the `WagonTrain` class, a `LinkedList` object is also instantiated and available as an attribute on the JungleBeat instance. Now, we can manage our linked list through the `WagonTrain` class.

Expected behavior:

```ruby
> require "./lib/wagon_train"
> wt = WagonTrain.new
=> <WagonTrain list=<LinkedList head=nil #234567890890> #456789045678>
> wt.list
=> <LinkedList head=nil #234567890890>
> wt.list.head
=> nil
> wt.append("Burke")
=> <Node surname="Burke" next_node=nil #5678904567890>
> wt.list.head.surname
=> "Burke"
> wt.append("West")
=> <Node surname="West" next_node=nil #5678904567890>
> wt.count
2
```

## Iteration 6 - Carrying Supplies

We have assembled the wagons for our train to the pacific, but we aren’t going to make it very far without supplies. It is, after all, a perilous journey.

Modify your classes so that `Nodes` are able to carry supplies. Supplies will be added whenever a new `Node` is created. So you will need to modify `append`, `insert`, and `prepend` wherever they appear.

Additionally, you should be able to list all the supplies in your `WagonTrain` as a single hash. If multiple wagons are carrying the same supplies, be sure to sum their amounts, so you can really tell how much you’re carrying.

Expected Behavior:

```ruby
> require "./lib/wagon_train"
> wt = WagonTrain.new
=> <WagonTrain list=<LinkedList @head=nil #234567890890> #456789045678>
> wt.append("Burke", {"pounds of food" => 200})
=> <Node @surname="Burke" @supplies={"pounds of food" => 200} @next_node=nil #5678904567890>
> wt.list.prepend("Hardy", {"spare wagon tongues" => 3})
=> <Node @surname="Hardy" @supplies={"spare wagon tongues" => 3} @next_node=<Node @surname="Burke" ... > #5678904567890>
> wt.list.insert(1, "West", {"pounds of food" => 300})
=> <Node @surname="West" @supplies={"pounds of food" => 300} @next_node=<Node @surname="Burke" ... > #5678904567890>
> wt.count
=> 3
> wt.supplies
=> {"spare wagon tongues" => 3, "pounds of food" => 500}
```

## Tips

- A linked list it not an array. While it may perform many of the same functions as an array, its structure is conceptually very different.  
- There are only 3 types of “state” that need to be tracked for a linked list – the head of the list, the data of each node, and the “next node” of each node.  
- In object-oriented programming, “state” is generally modeled with instance variables  
- There are two main ways to implement Linked Lists: **iteration** and **recursion**. Iterative solutions use looping structures (```while```, ```for```) to walk through the nodes in the list. Recursive solutions use methods which call themselves to walk through nodes. It would be ideal to solve it each way.  
- Most of your methods will be defined on the List itself, but you will need to manipulate one or more Nodes to implement them.  
- **TDD** will be your friend in implementing the list. Remember to start small, work iteratively, and test all of your methods.  
- An **empty** list has ```nil``` as its head.  
- The **tail** of a list is the node that has ```nil``` as its next node.  

## Constraints

- Make sure that your code is well tested for both *expected cases* and *edge cases*. Try popping more elements than there are in the list. Try seeing if an empty list includes anything. Try inserting elements at a position beyond the length of the list.  
- Avoid using other ruby collections (Arrays, Hashes, etc) for the storage of your beats. That’s where you’re supposed to use the linked list. But having Arrays elsewhere in your code, or using methods that return arrays (like ```.split```) are totally ok.  
