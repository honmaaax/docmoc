# docmoc
Documentation and Mock API Server for Swagger



## Features

* One port (changeable)
* Respond random mock data
* Respond specified mock data
* Respond a specified length mock array



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

If you set `x-mock` property, the API responds a specified value in JSON.

**swagger.yml**

```yaml
type: object
properties:
  foo:
    type: string
    x-mock: FOO
  bar:
    type: string
```

**Response**

```json
{
  "foo": "FOO",
  "bar": "SJ39mx1tWk2si87"
}
```

If you set an **array** to `x-mock` property, the API responds a randomly sampled value in JSON.

**swagger.yml**

```yaml
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

**Response**

```json
{
  "foo": 789,
  "bar": 61582903
}
```

### x-mock-array-size
`Integer`

If you set `x-mock-array-size` property, the API responds an array that has specified length elements.

**swagger.yml**

```yaml
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

**Response**

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

If you set `x-mock-array-key` property, the API responds a value in `x-mock-array-size` that is specified at the key.

**swagger.yml**

```yaml
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

**Response**

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
