#!/bin/bash

bundle exec bin/lint_configuration.rb
bundle exec bin/lint_dependencies.rb
bundle exec bin/lint_logos.rb
bundle exec bin/lint_yaml.rb
