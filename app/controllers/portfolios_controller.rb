# frozen_string_literal: true

# Portfolio controller
# This comment is to comply with rubocop
class PortfoliosController < ApplicationController
  def index
    @portfolio_items = Portfolio.angular
  end

  def new
    @portfolio = Portfolio.new
  end

  def show
    @portfolio = Portfolio.find(params[:id])
  end

  def destroy
    # perform lookup
    @portfolio = Portfolio.find(params[:id])

    # destroy record
    @portfolio.destroy

    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: "Record destroyed." }
    end
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

  def edit
    @portfolio = Portfolio.find(params[:id])
  end

  def update
    @portfolio = Portfolio.find(params[:id])
    respond_to do |format|
      if @portfolio.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: "Record was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  private

  def portfolio_params
    params.require(:portfolio).permit(:title, :subtitle, :body, :thumb_image)
  end
end
