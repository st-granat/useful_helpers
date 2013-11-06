# coding: utf-8
module UsefulHelpers
  module Helpers
    module SeoHelper
      def delimiter
        raw '&#32;&#8594;&#32;'
      end

      def page_title(page_title)
        content_for(:page_title) { raw("<h1>#{page_title}</h1>") }
      end

      def canonical(url)
        content_for :head do
          raw "<link rel=\"canonical\" href=\"#{url}\" />"
        end
      end

      def noindex
        content_for :head do
          noindex_tag
        end
      end

      def noindex_tag
        raw '<meta name="robots" content="noindex, nofollow" />'
      end

      def breadcrumbs(prefix, links)
        case prefix
          when "root"
            anchor = I18n.t("useful_helpers.breadcrumbs.root")
            path = "/"
          when "dashboard"
            anchor = I18n.t("useful_helpers.breadcrumbs.dashboard")
            path = "/dashboard"
          when "admin"
            anchor = I18n.t("useful_helpers.breadcrumbs.admin")
            path = "/admin"
          else
            anchor, path = nil, nil
        end
        return "" if path.nil?
        first_link = ["<a title=\"#{anchor}\" href=\"#{path}\">#{anchor}</a>"]
        content_for :breadcrumbs do
          raw "<div class=\"breadcrumbs\">#{(first_link+links).flatten.compact.join(delimiter)}</div>"
        end
      end

      def build_meta_title
        html = @meta_title
        if @medium_title.present?
          html << " — #{@medium_title}"
        end
        city_abbr = I18n.t("useful_helpers.city_abbr")
        regional_suffix = @city.present? ? @city.formatted : I18n.t("useful_helpers.regional_suffix")
        unless ca('welcome', 'index')
          if html.include?(regional_suffix)
            html << " — #{@site_name}"
          elsif @city.present?
            html << " — #{@site_name}, #{city_abbr} #{@city.ru}"
          else
            html << " — #{@full_site_name}"
          end
        end
        html << " | #{I18n.t('useful_helpers.page')} #{@page_counter}" if @page_counter && @page_counter != 1
        html
      end
    end
  end
end
