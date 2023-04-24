class ReviewsController < ApplicationController
    def review_params
        params.require(:review).permit(:id_user, :id_product, :content, :grade)
    end


    def index
        @reviews = Review.where(id_user: current_user.id)
    end


    def create
        @review = Review.new(review_params)
        
        if @review.save
            render json: {message: "Review was successfully created."}
        else
            render json: @review.errors, status: :unprocessable_entity
          
        end
    end


    def new
        @review = Review.new
        @order = Order.find(params[:id_order])
        @product = Product.find(params[:id_product])
      end

    def update
        @user = User.find(params[:id_user])
        @review = @user.reviews.find(params[:id])

        if @review.update(review_params)
            render json: {message: "Review was successfully updated."}
        else
            render json: @review.errors, status: :unprocessable_entity
        end
    end


    def destroy
        @user = User.find(current_user.id)
        @review = @user.reviews.find(params[:id])

        if @review.delete
            render json: {message: "Review was sucessfully deleted."}
        else
            render json: @review.errors, status: :unprocessable_entity
        end
    end

end
