require "action_view"

module CenterImageTag
  module ViewHelper
    include ActionView::Context
    include ActionView::Helpers::TagHelper
    include ActionView::Helpers::AssetTagHelper

    def center_image_tag(source, options = {})
      div class: 'standard-thumb thumb-fluid' do
        div class: 'thumb-default' do
          div class: 'thumb-clip' do
            div class: 'thumb-clip-inner' do
              image_tag(source, options) +
              tag(:span, class: 'vertical-align')
            end
          end
        end
      end
    end

    private
    def div(options = {}, &block)
      content_tag :div, options, &block
    end
  end
end

ActionView::Base.send :include, CenterImageTag::ViewHelper