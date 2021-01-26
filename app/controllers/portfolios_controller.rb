# frozen_string_literal: true

# Portfolio controller
# This comment is to comply with rubocop
class PortfoliosController < ApplicationController
  def index
    @portfolio_items = Portfolio.all
  end

  def new
    @portfolio = Portfolio.new
  end

  def create
    @portfolio = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio.save
        format.html { redirect_to portfolios_path, notice: "Portfolio was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def portfolio_params
    params.require(:portfolio).permit(:title, :subtitle, :body, :thumb_image)
  end
end
