# coding: utf-8
module UsefulHelpers
  module Helpers
    module UrlHelper
      def rc(prefix)
        request.request_uri.to_s.include?(prefix)
      end

      def cn(controller)
        params[:controller] == controller
      end

      def an(action)
        action_name == action
      end

      def ca(controller, action)
        params[:controller] == controller && action_name == action
      end

      ["index", "show", "new", "edit"].each do |action|
        define_method action do
          action_name == action
        end
      end

      # def skype_to(login)
      #   raw "<a href=\"skype:#{login}?call\">#{login}</a>"
      # end
    end
  end
end
