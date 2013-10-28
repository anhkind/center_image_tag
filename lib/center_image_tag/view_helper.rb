require "action_view"

module CenterImageTag
  module ViewHelper
    include ActionView::Context
    include ActionView::Helpers::TagHelper
    include ActionView::Helpers::AssetTagHelper

    def center_image_tag(source, options = {})
      if fluid_percentage = options.delete(:fluid)
        return container_fluid fluid_percentage do
          clip do
            image_tag(source, options) +
            tag(:span, class: "vertical-align")
          end
        end
      end

      image_tag(source, options)
    end

    private
    def container_fluid(fluid_percentage, &block)
      div class: "standard-thumb thumb-fluid" do
        div class: "thumb-default", style: "padding-bottom: #{fluid_percentage}", &block
      end
    end

    def clip(&block)
      div class: "thumb-clip" do
        div class: "thumb-clip-inner", &block
      end
    end

    def div(options = {}, &block)
      content_tag :div, options, &block
    end
  end
end

ActionView::Base.send :include, CenterImageTag::ViewHelper