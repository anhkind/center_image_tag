require 'spec_helper'

module CenterImageTag
  describe ViewHelper do
    it 'renders the html correctly' do
      output    = View.new.center_image_tag 'image.png'
      expected  = "<div class=\"standard-thumb thumb-fluid\">" +
                    "<div class=\"thumb-default\">" +
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
