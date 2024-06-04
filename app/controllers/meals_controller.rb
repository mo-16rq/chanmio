class MealsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]    
  def index
      if params[:search] == nil
        @meals = Meal.all
      elsif params[:search] == ''
        @meal= Meal.all
      else
        @meals = Meal.where("name LIKE ? ",'%' + params[:search] + '%')
      end
    end
    def healthy
      @healthy = Meal.where(genre:"ヘルシー")
    end
    def standard
      @standard = Meal.where(genre:"定番")
    end
    def main
      @main = Meal.where(genre:"メイン")
    end
    def side
      @side = Meal.where(genre:"サイド")
    end
    def drink
      @drink = Meal.where(genre:"ドリンク")
    end
    def dessert
      @dessert = Meal.where(genre:"デザート")
    end
    def new
      @meal = Meal.new
    end
    
    def create
      meal = Meal.new(meal_params)
      meal.user_id = current_user.id 
      if meal.save
        redirect_to :action => "index"
      else
        redirect_to :action => "new"
      end
    end    
      def show
        @meal = Meal.find(params[:id])
        if @meal.nil?
        else
          @comments = @meal.comments
          @comment = Comment.new
        end
      end

      def edit
        @meal =Meal.find(params[:id])
      end

      def update
        meal = Meal.find(params[:id])
        if meal.update(meal_params)
          redirect_to :action => "show", :id => meal.id
        else
          redirect_to :action => "new"
        end
      end

      def destroy
        meal = Meal.find(params[:id])
        meal.destroy
        redirect_to action: :index
      end
    
      private
      def meal_params
        params.require(:meal).permit(:name, :genre, :overall,:level, :image_top , images: [])
      end
end
