require 'bundler/setup'
require 'center_image_tag'

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.expect_with(:rspec) {|c| c.syntax = :expect}
  config.order = :random
end

class View; include CenterImageTag::ViewHelper; end