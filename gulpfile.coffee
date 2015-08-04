gulp = require 'gulp'
latex = require 'gulp-latex'
notify = require 'gulp-notify'
plumber = require 'gulp-plumber'

paths = 'src/*.tex'

gulp.task 'latex', ->
  gulp.src(paths)
  .pipe plumber()
  .pipe latex({command: 'pdflatex',format: 'pdf'})
  .pipe notify('LaTeX has been renewed!')
  .pipe gulp.dest('build')

gulp.task 'watch', ->
  gulp.watch(paths, ['latex'])
  return

gulp.task 'default', [
  'watch'
  'latex'
]
