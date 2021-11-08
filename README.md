# README

## Getting started

Run `bundle install` to install dependencies
Run `bundle exec rails s` to start the server

## Testing

All tests are stored under the `spec/` folder. To run the suite, use the command `bundle exec rspec`

## Example

A request to the API `http://localhost:3000/test_panels/TP2` should return the following JSON

```json
{
  "data": {
    "type": "test_panels",
    "id": "TP2",
    "attributes": {
      "price": 2100,
      "sample_tube_types": ["purple", "yellow"],
      "sample_volume_requirement": 220
    },
    "relationships": {
      "test": {
        "data": [
          { "id": "B12", "type": "test" },
          { "id": "HBA1C", "type": "test" }
        ]
      }
    }
  }
}
```

The endpoint also supports an 'include' query parameter that returns an 'included' field along with the response. e.g. `http://localhost:3000/test_panels/TP2` should return the following JSON

```json
{
  "data": {
    "type": "test_panels",
    "id": "TP2",
    "attributes": {
      "price": 2100,
      "sample_tube_types": ["purple", "yellow"],
      "sample_volume_requirement": 220
    },
    "relationships": {
      "test": {
        "data": [
          { "id": "B12", "type": "test" },
          { "id": "HBA1C", "type": "test" }
        ]
      }
    }
  },
  "included": [
    {
      "type": "test",
      "id": "B12",
      "attributes": {
        "name": "Vitamin B12",
        "sample_volume_requirement": 180,
        "sample_tube_type": "yellow"
      }
    },
    {
      "type": "test",
      "id": "HBA1C",
      "attributes": {
        "name": "HbA1C",
        "sample_volume_requirement": 40,
        "sample_tube_type": "purple"
      }
    }
  ]
}
```
