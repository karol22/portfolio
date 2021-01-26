# frozen_string_literal: true

# Portfolio controller
# This comment is to comply with rubocop
class PortfoliosController < ApplicationController
  def index
    @portfolio_items = Portfolio.all
  end
end
