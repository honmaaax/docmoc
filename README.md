# docmoc
Documentation and Mock API Server for Swagger



## Features

* One port (changeable)
* Respond random mock data
* Respond specified mock data
* Respond a specified length mock array
* Validate API request based on Swagger



## Install
`npm i -g docmoc` or `yarn global add docmoc`



## Run
`docmoc [options] [swagger_file_path]`



## Options

```
-p, --port <port>  Change port
-h, --help         output usage information
```



## Swagger Custom Properties

### x-mock
`String|Number|Boolean|Array`

If you set `x-mock` property, the API will respond a specified value in JSON.

```yaml
# swagger.yml
type: object
properties:
  foo:
    type: string
    x-mock: FOO
  bar:
    type: string
```

```json
{
  "foo": "FOO",
  "bar": "SJ39mx1tWk2si87"
}
```

If you set an **array** to `x-mock` property, the API will respond a randomly sampled value in JSON.

```yaml
# swagger.yml
type: object
properties:
  foo:
    type: integer
    x-mock:
      - 123
      - 456
      - 789
  bar:
    type: integer
```

```json
{
  "foo": 789,
  "bar": 61582903
}
```

### x-mock-array-size
`Integer`

If you set `x-mock-array-size` property, the API will respond an array that has specified length elements.

```yaml
# swagger.yml
type: array
items:
  type: object
  properties:
    name:
      type: string
    age:
      type: integer
      minimum: 18
      maximum: 99
x-mock-array-size: 3
```

```json
[
  {
    "name": "hU19Aksg436m",
    "age": 34
  },
  {
    "name": "Ek5s85Wq1",
    "age": 28
  },
  {
    "name": "cCm5T2l7815",
    "age": 73
  }
]
```

### x-mock-array-key
`String`

If you set `x-mock-array-key` property, the API will respond a value in `x-mock-array-size` that is specified at the key.

```yaml
# swagger.yml
type: object
properties:
  total:
    type: integer
    x-mock-array-key: users
  users:
    type: array
    items:
      type: object
      properties:
        name:
          type: string
        age:
          type: integer
          minimum: 18
          maximum: 99
    x-mock-array-size: 3
```

```json
{
  "total": 3,
  "users": [
    {
      "name": "hU19Aksg436m",
      "age": 34
    },
    {
      "name": "Ek5s85Wq1",
      "age": 28
    },
    {
      "name": "cCm5T2l7815",
      "age": 73
    }
  ]
}
```
