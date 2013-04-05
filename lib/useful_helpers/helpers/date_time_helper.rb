# coding: utf-8
module UsefulHelpers
  module Helpers
    module DateTimeHelper
	    def localize_date(date, format=:long)
		    I18n.localize(date, :format => format)
	    end
    end
  end
end
