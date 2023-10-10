# Page Builder POC

A Flutter POC to test the viability of a page builder for a low-code platform.

## Getting Started

To run this application, you need to have Flutter installed. Then, you can run the following command to run the application:

```bash
flutter run
```

### Data source

The data source is a JSON file located at `core/assets/db.json`. This file is the example for a real API implementation.
To run the app using this file, install the `json-server` package globally:

```bash
npm install -g json-server
```

Then, run the following command to start the server:

```bash
json-server --watch core/assets/db.json
```

After that, you can run the application.
