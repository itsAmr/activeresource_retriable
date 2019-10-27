# activeresource_retriable

Augment ActiveResource with a configurable retry mechanism built on [kamui/retriable](<https://github.com/kamui/retriable>).

## Usage

Instead of basing your resources on `ActiveResource::Base`, just base them off `ActiveResource::RetriableBase`.

You can then specify all of your _Retriable_ configuration within a `retriable` block returning a hash.

```Ruby
  class Resource < ActiveResource::RetriableBase
    retriable do
      {
        tries: 3,
        multiplier: 1.5
      }
    end
  end
```

Any request from under this _Resource_ class will apply the retry mechanism.

All configuration options are defined in [kamui/retriable](<https://github.com/kamui/retriable>).

## Contributing

TODO:

- Set up CI.
- Support retriable contexts.
