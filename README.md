# Linter Dart (Inactive)

**Please use the [dartlang](https://github.com/dart-atom/dartlang) package instead**

Provides linter support for Dart in Atom via `dartanalyzer`.

## Installation
Just run `apm install linter-dartanalyzer` or install it from the settings view.

You must also have the [Linter](https://github.com/AtomLinter/Linter) package installed.
You can install that by running `apm install linter` or installing the **linter** package in the settings view.

## Configuration
You must set in your `config.cson` file the path of your Dart SDK bin folder like so...
```coffeescript
'linter-dartanalyzer':
  'dartanalyzerExecutablePath': 'C:\\Program Files\\dart-sdk\\bin'
```

Mine is on Windows so I have to escape the backslashes. If you're on Linux or Mac you don't need to do that.
