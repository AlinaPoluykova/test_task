gulp = require 'gulp'
jade = require 'gulp-jade'
stylus = require 'gulp-stylus'
coffee = require 'gulp-coffee'
minifyCss = require 'gulp-minify-css'
uglify = require 'gulp-uglify'

gulp.task 'jade', ->
	gulp
	.src 'source/**/*.jade'
	.pipe do jade
	.pipe gulp.dest 'dest'

gulp.task 'stylus', ->
	gulp
	.src 'source/**/*.styl'
	.pipe do stylus
	.pipe minifyCss()
	.pipe gulp.dest 'dest'

gulp.task 'coffee', ->
	gulp
	.src 'source/**/*.coffee'
	.pipe do coffee
	.pipe uglify()
	.pipe gulp.dest 'dest'

gulp.task 'bower', ->
	gulp
	.src 'bower_components/**/*'
	.pipe gulp.dest 'dest/bower_components'

gulp.task 'json', ->
	gulp
	.src 'news.json'
	.pipe gulp.dest 'dest'

gulp.task 'img', ->
	gulp
	.src 'img/**/*'
	.pipe gulp.dest 'dest/img'

gulp.task 'fonts', ->
	gulp
	.src 'fonts/**/*'
	.pipe gulp.dest 'dest/fonts'

gulp.task 'watch', ->
	gulp.watch 'source/**/*.jade', ['jade']
	gulp.watch 'source/**/*.styl', ['stylus']
	gulp.watch 'source/**/*.coffee', ['coffee']

gulp.task 'dest', ['jade', 'stylus', 'coffee', 'bower', 'json', 'img', 'fonts']
gulp.task 'dev', ['dest', 'watch']



