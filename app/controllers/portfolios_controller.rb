class PortfoliosController < ApplicationController
  layout 'portfolio'
  before_action :set_portfolio_item, only: [:edit,:show,:update,:destroy]
  def index
    @portfolio_items = Portfolio.all
  end
  def new
    @portfolio_items = Portfolio.new
    3.times {@portfolio_items.technologies.build }
  end

  def create
    @portfolio_items = Portfolio.new(portfolio_params)
    respond_to do |format|
      if @portfolio_items.save
        format.html { redirect_to portfolios_path, notice: 'Blog was successfully created.' }

      else
        format.html { render :new }

      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @portfolio_items.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully updated.' }

      else
        format.html { render :edit }

      end
    end
  end

  def show
  end

  def destroy
    @portfolio_item.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'record was removed.' }
    end
  end

  private

  def portfolio_params
    params.require(:portfolio).permit(:title,
                                      :subtitle,
                                      :body,
                                      technologies_attributes: [:name]
                                      )
  end

  private
  def set_portfolio_item
    @portfolio_items = Portfolio.find(params[:id])
  end
end
