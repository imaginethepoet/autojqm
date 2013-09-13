module.exports = (grunt) ->
  grunt.initConfig

  # setup initial 3rd party assets from various libs
    bower:
      install:
        options:
          targetDir: "./lib"
          layout: "byComponent"
          install: true
          verbose: true
          cleanTargetDir: true
          cleanBowerDir: true

    shell:
      multiple:
        command:[
          'cd lib/jquery-mobile',
          'npm install',
          'grunt',          
        ].join('&&')

    copy:
      main:
        expand: true
        flatten: false
        cwd: "lib/jquery-mobile/dist"        
        src: "**"
        dest: "assets/js/"
    
    less:
      development:
        src: "build/custom/less/jqm-custom.less*"
        dest: "assets/css/jqm-custom.css"
        options:
          compress: false
          yuicompress: false
          optimization: 2          

    coffee:
      allcoffee:
        src: "build/custom/coffee/*.coffee"
        dest: "assets/js/app.js"
        options:
          join: true         

     bake:
        build: 
          files: "index.html":"build/custom/components/base.html"

  # lets watch all the stuff going on for live changes.
     watch:
        less:
          files: ["build/custom/less/**/*.less"] 
          tasks: ["less"]

        coffee:
          files: ["build/custom/coffee/**/*.coffee"]
          tasks: ["coffee"]

        bake:
          files: ["build/custom/components/**"]
          tasks: ["bake"]


  
  grunt.loadNpmTasks "grunt-contrib-copy"
  grunt.loadNpmTasks "grunt-shell"
  grunt.loadNpmTasks "grunt-bower-task"
  grunt.loadNpmTasks "grunt-contrib-copy"
  grunt.loadNpmTasks "grunt-contrib-less"
  grunt.loadNpmTasks "grunt-contrib-coffee"
  grunt.loadNpmTasks "grunt-bake"
  grunt.loadNpmTasks "grunt-git"
  grunt.loadNpmTasks "grunt-contrib-watch"



  grunt.registerTask "getjqm", "bower"
  grunt.registerTask "createjqm", "shell"
  grunt.registerTask "copyjqm", "copy"
  grunt.registerTask "bakeme", "bake"
  grunt.registerMultiTask "default", "bower shell copy"