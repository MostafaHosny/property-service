# Property Service API :sunny:

- Given latitude and longitude of an object, its type and marketing type, returns a list of similar objects with their prices.

## Getting Started

1. Clone the repository
2. Install dependencies and run `bundle install`
3. Setup database by running
  `rails db:create` && Import the database or load from schema
4. Start the app with `bundle exec rails s`

## Dependencies

- Ruby 2.5.1
- Postgres

## Development

- `activerecord-postgres-earthdistance` Check distances with latitude and longitude
 using PostgreSQL special indexes.
- JSON Responses should follow the [JSON API specification](http://jsonapi.org)
 by using `fast_jsonapi` Thanks to `Netflix` team  
 serializer for Ruby Objects faster 24 times than active model serializer.
- For more details check [Performance using Fast JSON API] (https://github.com/Netflix/fast_jsonapi/blob/master/performance_methodology.md)

## Running the tests

```shell
# Rspec
  rspec

# Rubocop
  rubocop
```

## Usage

1- Search nearby properties

- POST: `/api/v1/properties`

- Params: all of them are required at the moment
  - `lng` : `13.4236807`
  - `lat` : `52.5342963`
  - `property_type` : `apartment`
  - `marketing_type` : `sell`

- Response
```
  {
    "data": [
        {
            "id": "5387088",
            "type": "property",
            "attributes": {
                "house_number": null,
                "street": null,
                "city": "Berlin",
                "zip_code": "10115",
                "lat": "52.53177508",
                "lng": "13.38815072",
                "price": "269700.0"
            }
        },
        {
            "id": "5387077",
            "type": "property",
            "attributes": {
                "house_number": null,
                "street": null,
                "city": "Berlin",
                "zip_code": "10115",
                "lat": "52.5304903",
                "lng": "13.3791152",
                "price": "622500.0"
            }
        },
      ]
    }  
```
