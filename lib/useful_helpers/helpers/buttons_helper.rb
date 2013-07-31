# coding: utf-8
module ButtonsHelper
  def buttons(&block)
    content_for :buttons do
      content_tag :div, :class => "buttons", &block
    end
  end
end
