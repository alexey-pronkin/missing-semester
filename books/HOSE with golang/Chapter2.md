# Best Practices for Writing Clean and Maintainable Go Code

## The SOLID principles of object-oriented design

The SOLID principles are essentially a set of rules for helping you write clean and maintainable object-oriented code. Let's go over what the initials stand for:

- Single responsibility.
- Open/closed. "A software module should be open for extension but closed for modification."
- Liskov substitution. If, for each object, O_1 of type S there is an object O2 of type T such that for all programs P defined in terms of T, the behavior of P is unchanged when O1 is substituted for O_2, then S is a subtype of T. 
Principle was introduced by Barbara Liskov in 1987 while delivering a keynote session at the Object-Oriented Programming Systems, Languages, and Applications (OOPSLA) conference.
- Interface segregation. According to this principle, clients should not be forced to depend upon the interfaces that they do not use.
- Dependency inversion. High-level modules should not depend on low-level modules. Both should depend on abstractions. Abstractions should not depend on details. Details should depend on abstractions.

## Naming

Go package names should be short and concise and provide a clear indication of their purpose to the intended users of the package.

## Circular dependencies

- Breaking circular dependencies via implicit interfaces
TODO
- Wire components via a third package.

## "A little copying is better than a little dependency."

Good practice for writing Go programs is to try to keep your import dependency graph shallow and wide

## "Accept interfaces, return structs."

The KV store implementation looks like this:

```go
package kv

type Store struct {
     // ... creating of Store struct
     }
func Open(path string) (*Store, error){
    // This is the function that returns tuple (*Store, error) 
    // Open path, load and verify data, replay pending transoctions etc
}
func (s *Store) Put(key string, value interface{}) error { 
    // Put persists (key, value) to the store.
    // ...
}
func (s *Store) Get(key string) (interface{}, error) {
    // Method that return interface
    // Get looks up the value associated with key.

}
func (s *Store) Close() error { 
    // Close waits for any pending transactions to complete and then
    // cleanly shuts down the KV store.

    // ... 
    }

```

Within the metrics package, we can find the definition of the ReportMetrics function. It receives a kv.Store instance as an argument and persists the collected metrics to it:

```go
package metrics
// Sink is implemented by objects that metrics can be reported to.
type Sink interface {
Put(k string, v interface{}) error
}
// ReportMetrics writes the collected metrics to a Sink.
func (c *Collector) ReportMetrics(s Sink) error {
// for each metric call s.Put(k, v)
}
// Observe records a value for a particular metric.
func (c *Collector) Observe(metric string, value interface{}) {
// ...
}
```

Testing:

```go
func TestReportMetrics(t *testing.T) {
// Use in-memory store defined inside the test package
s := new(inMemStore)
// Create collector and populate some metrics
c := metrics.NewCollector()
for i := 0; i < 100; i++ {
    c.Observe(fmt.Sprintf("metric_%d", i), i)
}
    if err = c.ReportMetrics(s); err != nil {
        t.Fatal(err)
}
// Ensure that all metrics have been written to the store...
}
```
It is also important to point out that, in the majority of cases, the implementation will create
an instance of a concrete type; the main reason why we would opt to return an interface to
begin with is to ensure that our concrete type always satisfies a particular interface. In
essence, we are adding a compile-time check to our code! However, there are simpler ways
to introduce such compile-time checks and still retain the ability for constructors to return
concrete instances:

```go
package metrics
import "fmt"
// Compile-time checks for ensuring a type implements a particular
// interface.
var (
// Works but allocates a dummy Foo instance on the heap.
_ fmt.Stringer = &Foo{}
// Preferred way that does not allocate anything on the heap.
_ fmt.Stringer = (*Foo)(nil)
)
type Foo struct { }
func (*Foo) String() string { return "Foo" }
```

# Zero values are your friends