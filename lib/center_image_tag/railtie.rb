require 'rails/railtie'

module CenterImageTag
  class Railtie < Rails::Railtie
    config.after_initialize do |app|
      class ActionView::Base
        include CenterImageTag::ViewHelper
      end
    end
  end
end