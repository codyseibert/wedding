gulp = require 'gulp'
browserify = require 'gulp-browserify'
clean = require 'gulp-clean'
del = require 'del'
coffee = require 'gulp-coffee'
gutil = require 'gulp-util'
jade = require 'gulp-jade'
sass = require 'gulp-sass'
ngTemplates = require 'gulp-ng-templates'
gulpIgnore = require 'gulp-ignore'
connect = require 'gulp-connect'
replace = require 'gulp-replace'
args = require('yargs').argv

isProduction = args.env is 'production'

gulp.task 'clean', ->
  del.sync [ 'tmp', 'build', 'dist' ]

gulp.task 'copy', ->
  gulp.src('src/images/*')
    .pipe gulp.dest('dist/images')
    .pipe connect.reload()

  gulp.src('src/songs/*')
    .pipe gulp.dest('dist/songs')
    .pipe connect.reload()

  gulp.src('bower_components/**/*')
    .pipe gulp.dest('dist/bower_components')
    .pipe connect.reload()

gulp.task 'jade', ->
  gulp.src 'src/**/*.jade'
    .pipe jade
      pretty: true
    .pipe gulp.dest 'dist'
    .pipe connect.reload()

gulp.task 'sass', ->
  gulp.src('src/**/*.sass')
    .pipe(sass().on('error', gutil.log))
    .pipe(gulp.dest('dist'))
    .pipe connect.reload()

gulp.task 'coffee', ->
  gulp.src('src/**/*.coffee')
    .pipe(coffee({bare: true})
    .on('error', gutil.log))
    .pipe(gulp.dest('dist'))
    .pipe connect.reload()

gulp.task 'replace', ['coffee'], ->
  if isProduction
    gulp.src(['dist/app.js'])
      .pipe(replace('http://localhost:8081', 'http://weddingapi.codyseibert.com'))
      .pipe(gulp.dest('dist'))

gulp.task 'connect', ->
  connect.server
    root: 'dist'
    livereload: true

gulp.task 'watch', ->
  gulp.watch ['src/**/*.jade'], [
    'jade'
  ]

  gulp.watch 'src/**/*.sass', [
    'sass'
  ]

  gulp.watch 'src/**/*.coffee', [
    'coffee'
  ]

  gulp.watch 'images/*', [
    'copy'
  ]

gulp.task 'build', [
  'clean'
  'copy'
  'jade'
  'sass'
  'coffee'
  'replace'
]

gulp.task 'default', [
  'build'
  'connect'
  'watch'
]
