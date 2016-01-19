var gulp = require('gulp');
var codeclimate = require('gulp-codeclimate-reporter');

gulp.task('codeclimate', function() {
  if (process.version.indexOf('v4') > -1) {
    gulp.src('coverage/lcov.info', { read: false })
      .pipe(codeclimate({
        token: '55df4cb5f81fb746410bac918d28ad9be945f8083310421f1cb280e9aae88a78'
      }));
  }
});

