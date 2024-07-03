# Synchronous vs Asynchronous (Reactive) programming
Synchronous tasks happen in order — you must finish task one before moving on to the next. Asynchronous tasks can be executed in any order, or even simultaneously.

- [Asynchronous vs. Synchronous Programming: Key Similarities and Differences](https://www.mendix.com/blog/asynchronous-vs-synchronous-programming/)

## Asynchronous (Reactive) programming
- [Reactive programming wiki](https://en.wikipedia.org/wiki/Reactive_programming)

### Change propagation algorithms (Push Pull)
- [wiki](https://en.wikipedia.org/wiki/Reactive_programming#Change_propagation_algorithms)

The most common approaches to data propagation are:

- **Pull**: The value consumer is in fact proactive, in that it regularly queries the observed source for values and reacts whenever a relevant value is available. This practice of regularly checking for events or value changes is commonly referred to as polling.
- **Push**: The value consumer receives a value from the source whenever the value becomes available. These values are self-contained, e.g. they contain all the necessary information, and no further information needs to be queried by the consumer.
- **Push-pull**: The value consumer receives a change notification, which is a short description of the change, e.g. "some value changed" – this is the push part. However, the notification does not contain all the necessary information (which means it does not contain the actual values), so the consumer needs to query the source for more information (the specific value) after it receives the notification – this is the pull part. This method is commonly used when there is a large volume of data that the consumers might be potentially interested in. So in order to reduce throughput and latency, only light-weight notifications are sent; and then those consumers which require more information will request that specific information. This approach also has the drawback that the source might be overwhelmed by many requests for additional information after a notification is sent.
