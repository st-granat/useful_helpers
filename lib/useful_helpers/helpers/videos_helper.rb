# coding: utf-8
module UsefulHelpers
  module Helpers
    module VideosHelper
      def url_for_video(source_path)
        "http://" + request.url.split("/")[2] + source_path
      end

      def url_for_video_thumbnail(video, style=:small)
        video.data.url(style)
      end

      def video_thumbnail(video, style=:small)
        raw "<img src=\"#{video.data.url(style)}\" alt=\"#{video.title}\" />"
      end
    end
  end
end
