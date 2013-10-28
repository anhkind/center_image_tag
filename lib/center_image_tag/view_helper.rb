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
      else
        width, height = dimension(options)
        if width && height
          return container_fixed width, height do
            clip do
              image_tag(source, rebuild_options(options, width, height)) +
                tag(:span, class: "vertical-align")
            end
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

    def container_fixed(width, height, &block)
      div class: "standard-thumb", style: "width: #{width}px" do
        div class: "thumb-default", style: "padding-bottom: #{height}px", &block
      end
    end

    def clip(&block)
      div class: "thumb-clip" do
        div class: "thumb-clip-inner", &block
      end
    end

    def dimension(options)
      if size = options[:size]
        width, height   = size.split("x") if size =~ %r{\A\d+x\d+\z}
        width = height  = size            if size =~ %r{\A\d+\z}
      else
        width   = options[:width]
        height  = options[:height]
      end

      [width, height]
    end

    def div(options = {}, &block)
      content_tag :div, options, &block
    end

    def rebuild_options(options, width, height)
      # rebuild options
      options.delete(:size)
      options.delete(:height)
      options.merge(width: width)
    end
  end
end

ActionView::Base.send :include, CenterImageTag::ViewHelper