# coding: utf-8
module UsefulHelpers
  module Helpers
    module PaginateHelper
      def paginate(collection)
        html = will_paginate(collection).gsub('/page-1"', '/"').gsub('_/', '') rescue nil
        if html && request.fullpath.include?("page-")
          html = html.gsub("page-#{params[:page]}/", "")
        end
        raw html
      end
    end
  end
end
