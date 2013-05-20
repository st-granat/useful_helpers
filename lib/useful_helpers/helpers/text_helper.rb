# coding: utf-8
module UsefulHelpers
  module Helpers
    module TextHelper
      def raw_or_simple_format(text)
        text.include?("</p>") ? raw(text) : simple_format(text)
      end
    end
  end
end
