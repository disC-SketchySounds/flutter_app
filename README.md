# flutter_app

The front end iPad app made in flutter

## API Calls

### Mocking the API with Prism

- Download prism

```bash
npm install -g @stoplight/prism-cli
```


- Run mock api

```bash
prism mock openapi.json
```

- Call api with `curl`.

```bash
curl -X POST -F "sketch=example-image.png" http://127.0.0.1:4010/upload
```
