# Nodulo

## About project

Nodulo - it's own book cloud.

### Nested applications

The project is umberella application,
so all logic divided into separated nested applications in `/apps` directory.

This directory contain the next applications:

* **Api** - the front application with public API over another internal apps.
* **Bellas** - the application for working with user data.
* **Elisen** - the application for working with entries (books).

## Installation

### Requirements

* Erlang >= 22
* Elixir >= 1.8.2

### Dependencies

To setup dependencies for local environment You need to execute:

```sh
mix deps.get
```
