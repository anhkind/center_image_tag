require "action_view"

module CenterImageTag
  module ViewHelper
    include ActionView::Context
    include ActionView::Helpers::TagHelper
    include ActionView::Helpers::AssetTagHelper

    def center_image_tag(source, options = {})
      content_tag :div, class: 'standard-thumb thumb-fluid' do
        content_tag :div, class: 'thumb-default' do
          content_tag :div, class: 'thumb-clip' do
            content_tag :div, class: 'thumb-clip-inner' do
              image_tag(source, options) +
                tag(:span, class: 'vertical-align')
            end
          end
        end
      end
    end
  end
end

ActionView::Base.send :include, CenterImageTag::ViewHelper