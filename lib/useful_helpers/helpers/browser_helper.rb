# coding: utf-8
module UsefulHelpers
  module Helpers
    module BrowserHelper
      def normal_browser?
        !(request.env['HTTP_USER_AGENT'] =~ /MSIE (6|5|4|3|2)/)
      end

      def ie_browser?
        request.env['HTTP_USER_AGENT'] =~ /MSIE/
      end
    end
  end
end
