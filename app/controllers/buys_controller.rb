class BuysController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @buy_delivery = BuyDelivery.new
  end

  def new
  end

  def create
    binding.pry
  end
end
