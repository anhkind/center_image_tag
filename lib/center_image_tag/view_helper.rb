module CenterImageTag
  module ViewHelper
    include ActionView::Context
    include ActionView::Helpers::TagHelper
    include ActionView::Helpers::AssetTagHelper

    def center_image_tag(source, options = {})
      container_class = options.delete(:container_class)
      if fluid_percentage = options.delete(:fluid)
        return container_fluid(fluid_percentage, container_class) do
          clip do
            image_tag(source, options) +
              tag(:span, class: "vertical-align")
          end
        end
      else
        width, height = dimension(options)
        if width && height
          return container_fixed(width, height, container_class) do
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
    def container_fluid(fluid_percentage, outer_class, &block)
      div class: "cit-standard-thumb cit-thumb-fluid #{outer_class}" do
        div class: "cit-thumb-default", style: "padding-bottom: #{fluid_percentage}", &block
      end
    end

    def container_fixed(width, height, outer_class, &block)
      div class: "cit-standard-thumb #{outer_class}", style: "width: #{width}px" do
        div class: "cit-thumb-default", style: "padding-bottom: #{height}px", &block
      end
    end

    def clip(&block)
      div class: "cit-thumb-clip" do
        div class: "cit-thumb-clip-inner", &block
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
      options.delete(:width)
      options.merge(style: "width: #{width}px")
    end
  end
end
