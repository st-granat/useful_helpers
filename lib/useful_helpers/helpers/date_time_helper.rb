# coding: utf-8
module UsefulHelpers
  module Helpers
    module DateTimeHelper
      def localize_date(date, format=:long)
        I18n.localize(date, :format => format) rescue ""
      end

      ["long", "short"].each do |date_format|
        define_method "#{date_format}date" do |date|
          I18n.l(date, :format => date_format.to_sym) rescue ""
        end
      end
    end
  end
end
