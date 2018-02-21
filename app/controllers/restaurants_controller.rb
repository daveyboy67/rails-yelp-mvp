class RestaurantsController < ApplicationController
    def index
      @restaurants = Restaurant.all
    end

    def show
      @restaurant = Restaurant.find(params[:id])
    end

    def new
      @restaurant = Restaurant.new
    end

    def create
      @restaurant = Restaurant.new(restaurant_params)
      if @restaurant.save
        redirect_to restaurant_path(@restaurant)
      else
        render :new
      end
    end

    def update
      if @restaurant.update(restaurant_params)
        redirect_to restaurant_path(@restaurant)
      else
        render :edit
      end
    end



    private


    def restaurant_params
      params.required(:restaurant).permit(:name, :address, :phone_number, :category)
    end

end


