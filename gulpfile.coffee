gulp = require 'gulp'
latex = require 'gulp-latex'
notify = require 'gulp-notify'
plumber = require 'gulp-plumber'
watch = require 'gulp-watch'
cache = require 'gulp-cached'

paths = 'src/philippe_rigovanov.tex'

gulp.task 'latex', ->
  gulp.src(paths)
  .pipe cache('rendering')
  .pipe plumber()
  .pipe latex({command: 'pdflatex', format: 'pdf'})
  .pipe notify('LaTeX has been renewed!')
  .pipe gulp.dest('build')

gulp.task 'watch-latex', ->
  gulp.watch(paths, gulp.series('latex'))
  return

source = 'build/phil*.pdf'
destination = '/Users/phil/Documents/Яндекс.Диск/Documents'
gulp.task 'watch-folder', ->
  gulp.src(source).pipe(watch(source)).pipe gulp.dest(destination)
  return

gulp.task 'default', gulp.series('latex', gulp.parallel('watch-latex', 'watch-folder'))