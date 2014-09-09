path = require 'path'

module.exports =
  configDefaults:
    dartanalyzerExecutablePath: null

  activate: ->
    console.log 'activate linter-dart'
