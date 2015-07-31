gulp = require 'gulp'
latex = require 'gulp-latex'
notify = require 'gulp-notify'

paths = 'src/*.tex'

gulp.task 'latex', ->
  gulp.src(paths)
  .pipe latex()
  .pipe notify('LaTeX has been renewed!')
  .pipe gulp.dest('./build')

gulp.task 'watch', ->
  gulp.watch(paths, ['latex'])
  return

gulp.task 'default', [
  'watch'
  'latex'
]
