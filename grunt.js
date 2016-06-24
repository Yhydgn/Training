module.exports = function(grunt) {
	grunt.initConfig({
		concat: {
			dist: {
				src: ['js/libs/*'],
				dest: 'js/vendor.min.js'
			}
		},
		min: {
			dist: {
				src: ['js/app.js'],
				dest: 'js/app.min.js'
			}
		},
		css: {
			'css/style.min.css': ['css/jquery.ui.custom.css', 'css/main.css', 'css/style.css']
		},
	});
};
