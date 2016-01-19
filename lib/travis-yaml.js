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
        try {
          var yml = yaml.safeLoad(file);
          fn(null, yml);
        } catch(e) {
          console.log(e.message);
          fn(e, null);
        }
      }
    });
  } else {
    try {
      var file = fs.readFileSync(travis);
      return yaml.safeLoad(file);
    } catch (e) {
      console.log(e.message);
      return null;
    }
  }
};
