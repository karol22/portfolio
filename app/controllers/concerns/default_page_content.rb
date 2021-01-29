# frozen_string_literal: true

# Class to manage default layout content
module DefaultPageContent
  extend ActiveSupport::Concern

  included do
    before_action :set_page_defaults
  end

  def set_page_defaults
    @page_title = "My Portfolio Website"
    @seo_keywords = "Karol Gutiérrez portfolio"
  end
end
