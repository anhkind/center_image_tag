require "action_view"

module CenterImageTag
  module ViewHelper
    include ActionView::Context
    include ActionView::Helpers::TagHelper
    include ActionView::Helpers::AssetTagHelper

    def center_image_tag(source, options = {})
      fluid =  options[:size] || options[:width] || options[:height] ? false : true

      container_outer fluid do
        container_inner do
          clip_outer do
            clip_inner do
              image_tag(source, options) +
              tag(:span, class: "vertical-align")
            end
          end
        end
      end
    end

    private
    def container_outer(fluid = nil, &block)
      div class: "standard-thumb#{' thumb-fluid' if fluid}", &block
    end

    def container_inner(&block)
      div class: "thumb-default", &block
    end

    def clip_outer(&block)
      div class: "thumb-clip", &block
    end

    def clip_inner(&block)
      div class: "thumb-clip-inner", &block
    end

    def div(options = {}, &block)
      content_tag :div, options, &block
    end
  end
end

ActionView::Base.send :include, CenterImageTag::ViewHelper