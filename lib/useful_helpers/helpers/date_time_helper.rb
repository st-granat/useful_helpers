# coding: utf-8
module UsefulHelpers
  module Helpers
    module DateTimeHelper
	    def localize_date(date, format=:long)
	      begin
  		    I18n.localize(date, :format => format)
		    rescue
		      ""
		    end
	    end
    end
  end
end
