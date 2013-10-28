require 'spec_helper'

module CenterImageTag
  describe ViewHelper do
    describe 'normal' do
      it 'renders the image normally if it\'s not fluid or width x height set' do
        output    = View.new.center_image_tag 'image.png'
        expected  = "<img alt=\"Image\" src=\"/images/image.png\" />"
        expect(output).to eq expected
      end
    end

    describe 'fluid' do
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

    describe 'fixed' do
      it 'renders the fixed image correctly from size options (size = widthxheight)' do
        output    = View.new.center_image_tag 'image.png', size: "200x100"
        expected  = "<div class=\"standard-thumb\" style=\"width: 200px\">" +
                      "<div class=\"thumb-default\" style=\"padding-bottom: 100px\">" +
                        "<div class=\"thumb-clip\">" +
                          "<div class=\"thumb-clip-inner\">" +
                            "<img alt=\"Image\" src=\"/images/image.png\" width=\"200\" />" +
                            "<span class=\"vertical-align\" />" +
                          "</div>" +
                        "</div>" +
                      "</div>" +
                    "</div>"
        expect(output).to eq expected
      end

      it 'renders the fixed image correctly from size options (single size value)' do
        output    = View.new.center_image_tag 'image.png', size: "200"
        expected  = "<div class=\"standard-thumb\" style=\"width: 200px\">" +
                      "<div class=\"thumb-default\" style=\"padding-bottom: 200px\">" +
                        "<div class=\"thumb-clip\">" +
                          "<div class=\"thumb-clip-inner\">" +
                            "<img alt=\"Image\" src=\"/images/image.png\" width=\"200\" />" +
                            "<span class=\"vertical-align\" />" +
                          "</div>" +
                        "</div>" +
                      "</div>" +
                    "</div>"
        expect(output).to eq expected
      end

      it 'renders the fixed image correctly from width and height options' do
        output    = View.new.center_image_tag 'image.png', width: "200", height: 100
        expected  = "<div class=\"standard-thumb\" style=\"width: 200px\">" +
                      "<div class=\"thumb-default\" style=\"padding-bottom: 100px\">" +
                        "<div class=\"thumb-clip\">" +
                          "<div class=\"thumb-clip-inner\">" +
                            "<img alt=\"Image\" src=\"/images/image.png\" width=\"200\" />" +
                            "<span class=\"vertical-align\" />" +
                          "</div>" +
                        "</div>" +
                      "</div>" +
                    "</div>"
        expect(output).to eq expected
      end
    end
  end
end
