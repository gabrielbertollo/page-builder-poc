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

### The dependencies management

This project uses a mix of two approaches to manage the dependencies:
Provider and GetIt.

The Provider package is used for passing the dependencies down the widget tree, using the context to access them. This is the approach that best suited the navigation between pages, since the GetIt package does not provide a way to access the context.

The GetIt package is used for everything else related to the dependencies management. The objects are registered in the build method of components that make use of them and can then be accessed anywhere in the application, whithout the need of passing them down the widget tree and using the context to access them.
