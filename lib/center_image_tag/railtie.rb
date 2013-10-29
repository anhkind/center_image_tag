module CenterImageTag
  class Engine < ::Rails::Engine
    initializer 'center_image_tag.initialize' do
      ActiveSupport.on_load(:action_view) do
        include CenterImageTag::ViewHelper
      end
    end
  end
end