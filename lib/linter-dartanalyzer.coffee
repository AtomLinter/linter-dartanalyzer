linterPath = atom.packages.getLoadedPackage("linter").path
Linter = require "#{linterPath}/lib/linter"
{findFile, warn} = require "#{linterPath}/lib/utils"

class LinterDartAnalyzer extends Linter
  # The syntax that the linter handles. May be a string or
  # list/tuple of strings. Names should be all lowercase.
  @syntax: 'source.dart'
  # A string, list, tuple or callable that returns a string, list or tuple,
  # containing the command line (with arguments) used to lint.
  cmd: ['dartanalyzer', '--format=machine']

  linterName: 'dartanalyzer'

  # A regex pattern used to extract information from the executable's output.
  regex:
    '((?<error>ERROR)|(?<warning>WARNING)|(?<warning>INFO))\\|(?<type>\\w+)\\|(?<code>\\w+)\\|(?<file>.+)\\|(?<line>\\d+)\\|(?<col>\\d+)\\|(?<err_length>\\d+)\\|(?<message>.+)'
    # '^(?<severity>\\w+)\\|(?<type>\\w+)\\|(?<code>\\w+)\\|' +
    # '(?<file_name>.+)\\|(?<line>\\d+)\\|(?<col>\\d+)\\|' +
    # '(?<err_length>\\d+)\\|(?<message>.+)'

  isNodeExecutable: no

  errorStream: 'stderr'

  constructor: (editor) ->
    super(editor)

    # config = findFile @cwd, ['.jshintrc']
    # if config
    #   @cmd = @cmd.concat ['-c', config]

    atom.config.observe 'linter-dartanalyzer.dartanalyzerExecutablePath', @formatShellCmd

  formatShellCmd: =>
    dartanalyzerExecutablePath = atom.config.get 'linter-dartanalyzer.dartanalyzerExecutablePath'
    @executablePath = "#{dartanalyzerExecutablePath}"

  # createMessage: (match) ->
  #   console.log match
  #   # message might be empty, we have to supply a value
  #   if match and match.type == 'parse' and not match.message
  #     message = 'error'
  #
  #   super(match)

  # formatMessage: (match) ->
  #   console.log match
  #   type = match.severity
  #
  #   "#{match.message} (#{type}, #{match.code})"

  destroy: ->
    atom.config.unobserve 'linter-dartanalyzer.dartanalyzerExecutablePath'

module.exports = LinterDartAnalyzer
