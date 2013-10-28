require 'spec_helper'

module CenterImageTag
  describe ViewHelper do
    it 'renders the image normally if it\'s not fluid or width x height set' do
      output    = View.new.center_image_tag 'image.png'
      expected  = "<img alt=\"Image\" src=\"/images/image.png\" />"
      expect(output).to eq expected
    end

    it 'renders the fluid image correctly' do
      output    = View.new.center_image_tag 'image.png', fluid: "56.25%"
      expected  = "<div class=\"standard-thumb thumb-fluid\">" +
                    "<div class=\"thumb-default\" style=\"padding-bottom: 56.25%\">" +
                      "<div class=\"thumb-clip\">" +
                        "<div class=\"thumb-clip-inner\">" +
                          "<img alt=\"Image\" src=\"/images/image.png\" />" +
                          "<span class=\"vertical-align\" />" +
                        "</div>" +
                      "</div>" +
                    "</div>" +
                  "</div>"
      expect(output).to eq expected
    end
  end
end
