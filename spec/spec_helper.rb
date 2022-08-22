require 'minitest/autorun'

$LOAD_PATH.unshift(%(#{__dir__}/../config))
require 'config'

# rubocop:disable Style/MixinUsage
include Exceptions
# rubocop:enable Style/MixinUsage
