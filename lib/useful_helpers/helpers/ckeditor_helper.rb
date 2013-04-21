# coding: utf-8
module CkeditorHelper
  def ckeditor
    content_for :javascripts do
      javascript_include_tag("ckeditor/init")
    end

    content_for :stylesheets do
      stylesheet_link_tag("ckeditor")
    end
  end
end
