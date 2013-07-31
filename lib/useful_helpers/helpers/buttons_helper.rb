# coding: utf-8
module UsefulHelpers
  module Helpers
    module ButtonsHelper
      def buttons(&block)
        content_for :buttons do
          content_tag :div, :class => "buttons", &block
        end
      end
    end
  end
end
