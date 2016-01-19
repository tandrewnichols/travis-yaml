[![Build Status](https://travis-ci.org/tandrewnichols/travis-yaml.png)](https://travis-ci.org/tandrewnichols/travis-yaml) [![downloads](http://img.shields.io/npm/dm/travis-yaml.svg)](https://npmjs.org/package/travis-yaml) [![npm](http://img.shields.io/npm/v/travis-yaml.svg)](https://npmjs.org/package/travis-yaml) [![Code Climate](https://codeclimate.com/github/tandrewnichols/travis-yaml/badges/gpa.svg)](https://codeclimate.com/github/tandrewnichols/travis-yaml) [![Test Coverage](https://codeclimate.com/github/tandrewnichols/travis-yaml/badges/coverage.svg)](https://codeclimate.com/github/tandrewnichols/travis-yaml) [![dependencies](https://david-dm.org/tandrewnichols/travis-yaml.png)](https://david-dm.org/tandrewnichols/travis-yaml)

# travis-yaml

Load your travis yaml configuration into node

## Installation

`npm install --save travis-yaml`

## Summary

This library does what you'd expect: loads your .travis.yml as an object. You can do this synchronously or asynchronously (by passing a callback).

```js
var travisYaml = require('travis-yaml');

// Sync
var travis = travisYaml();

// Async
travisYaml(function(err, travis) {

});
```

## Contributing

Please see [the contribution guidelines](CONTRIBUTING.md).
