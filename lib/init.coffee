module.exports =
  config:
    dartanalyzerExecutablePath:
      type: 'string'
      default: ''

  activate: ->
    console.log 'activate linter-dartanalyzer'
