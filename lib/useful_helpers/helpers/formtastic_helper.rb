# coding: utf-8
module UsefulHelpers
  module Helpers
    module FormtasticHelper
      def formtastic_cancel_button(object, redirect_path=nil)
        path =
        if redirect_path
          redirect_path
        else
          if object.new_record?
            collection_path
          else
            resource_path(object)
          end
        end
        content_tag :li,
            link_to(
              t("web-app-theme.cancel"),
              path,
              :class => "cancel"
            ),
            :class => "commit_button"
      end

      def actions_for(form, label=nil)
        print_label = label ? label : nil
        html = ""
        html += form.actions do
          submit_for(form, print_label) + cancel_for(form)
        end
        raw html
      end

      def submit_for(form, label=nil)
        print_label = label ? label : "Отправить"
        form.action :submit,
                    :as => :button,
                    :label => raw("<span class='b-btn__wrap g-dib'>#{print_label}</span>"),
                    :button_html => {:class => "b-btn _blue g-dib"}
      end

      def cancel_for(form, label=nil)
        print_label = label ? label : "Отмена"
        form.action :cancel,
                    :as => :link,
                    :label => print_label,
                    :button_html => {:class => "a_button cancelite"}
      end
    end
  end
end
