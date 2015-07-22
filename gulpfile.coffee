gulp = require 'gulp'
latex = require 'gulp-latex'

paths = 'src/*.tex'

gulp.task 'latex', ->
  gulp.src(paths)
  .pipe(latex())
  .pipe gulp.dest('./build')

gulp.task 'watch', ->
  gulp.watch(paths, ['latex'])
  return

gulp.task 'default', [
  'watch'
  'latex'
]
