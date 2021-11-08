# NOTES

## Approach

- Returning test panel with associated tests in the endpoint (without serializer)
  - Adding `ActiveModel::Model` to both models and returning model instance when query by id
  - Raise error in the model and resccue error in the endpoint
- Adding serializer to format data into expected json
- Adding `included` param
  - Validate param
  - Returning included serialized tests data in the endpoint

## Improvement

I spent around 2 hours working on this challenge, these are something I would improve or add:

- Making `included` params handling more extendable
  - At the moment it only allows `test` to be the value of `included`, which is expected, but the returned json is very `test` specific. If I spent more time, I would fetch the data depending on the `included` value.
- Adding more tests (e.g. the tests for serializers hasn't been added)
