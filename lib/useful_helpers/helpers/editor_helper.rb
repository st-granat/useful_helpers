# coding: utf-8
module UsefulHelpers
  module Helpers
    module EditorHelper
      def editor
        render "shared/editor"
      end

      alias_method :ckeditor, :editor
    end
  end
end
