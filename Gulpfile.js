const gulp = require('gulp');
const sass = require('gulp-sass');
const pug = require('gulp-pug');
const rename = require('gulp-rename');
const browserSync = require('browser-sync').create();

gulp.task('demo', ['demo:scss', 'demo:pug'], () => {
  browserSync.init({ server: 'demo' });
  gulp.watch('demo/**/*.scss', ['demo:scss']);
  gulp.watch('demo/**/*.pug', ['demo:pug']);
});

gulp.task('demo:scss', () => (
  gulp
    .src('demo/demo.scss')
    .pipe(sass({ includePaths: ['scss'] }).on('error', sass.logError))
    .pipe(gulp.dest('demo'))
    .pipe(browserSync.stream())
));

gulp.task('demo:pug', () => (
  gulp
    .src('demo/index.pug')
    .pipe(pug({ basedir: 'demo' }))
    .pipe(gulp.dest('demo'))
    .pipe(browserSync.stream())
));
