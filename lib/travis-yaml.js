var yaml = require('js-yaml');
var fs = require('fs');
var root = require('app-root-path');

module.exports = function(fn) {
  var travis = root + '/.travis.yml';
  if (fn) {
    fs.readFile(travis, function(err, file) {
      if (err) {
        fn(err);
      } else {
        fn(null, yaml.safeLoad(file));
      }
    });
  } else {
    var file = fs.readFileSync(travis);
    return yaml.safeLoad(file);
  }
};
