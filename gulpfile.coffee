gulp = require 'gulp'
latex = require 'gulp-latex'
notify = require 'gulp-notify'
plumber = require 'gulp-plumber'
watch = require 'gulp-watch'

paths = 'src/*.tex'

gulp.task 'latex', ->
  gulp.src(paths)
  .pipe plumber()
  .pipe latex({command: 'pdflatex', format: 'pdf'})
  .pipe notify('LaTeX has been renewed!')
  .pipe gulp.dest('build')

gulp.task 'watch', ->
  gulp.watch(paths, ['latex'])
  return

source = '/Users/phil/my/tex/build/math*.pdf'
destination = '/Users/phil/Documents/Яндекс.Диск/!University/Math'
gulp.task 'watch-folder', ->
  gulp.src(source).pipe(watch(source)).pipe gulp.dest(destination)
  return

gulp.task 'default', [
  'watch'
  'latex'
  'watch-folder'
]
