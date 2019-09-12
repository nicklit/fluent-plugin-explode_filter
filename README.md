# Abandoned Project

**NOTE**: This project is no longer being maintained.

# Fluent::Plugin::ExplodeFilter

This gem provides the explode Fluentd filter which is used to convert period separated fields to nested hashes. 

The current use case being to expand Gelf formatted messages as well as to ensure compatibility with newer elasticsearch versions.

## Requirements

* Fluentd v0.12+
* fluent-plugin-mutate_filter

## Installation

```bash
gem install fluent-plugin-explode_filter
```

## Configuration Options

```
<filter *>
  @type explode
</filter
```

## Example

```json
{
  "short_message": "a short message",
  "context.level": 5,
  "context.revision": "sha256"
}
```

```json
{
  "short_message": "a short message",
  "context": {
    "level": 5,
    "revision": "sha256"
  }
}
```
