# coding: utf-8
require "useful_helpers/helpers/browser_helper"
require "useful_helpers/helpers/editor_helper"
require "useful_helpers/helpers/date_time_helper"
require "useful_helpers/helpers/formtastic_helper"
require "useful_helpers/helpers/paginate_helper"
require "useful_helpers/helpers/seo_helper"
require "useful_helpers/helpers/url_helper"
require "useful_helpers/helpers/text_helper"

module UsefulHelpers
  class Engine < ::Rails::Engine
    isolate_namespace UsefulHelpers
    engine_name "useful_helpers"

    initializer "useful_helpers.includers" do |app|
      ActionView::Base.send :include, UsefulHelpers::Helpers::BrowserHelper
      ActionView::Base.send :include, UsefulHelpers::Helpers::EditorHelper
      ActionView::Base.send :include, UsefulHelpers::Helpers::DateTimeHelper
      ActionView::Base.send :include, UsefulHelpers::Helpers::FormtasticHelper
      ActionView::Base.send :include, UsefulHelpers::Helpers::PaginateHelper
      ActionView::Base.send :include, UsefulHelpers::Helpers::SeoHelper
      ActionView::Base.send :include, UsefulHelpers::Helpers::UrlHelper
      ActionView::Base.send :include, UsefulHelpers::Helpers::TextHelper
    end
  end
end
