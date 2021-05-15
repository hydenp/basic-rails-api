class ProductController < ApplicationController
    # before_action :set_product, only: [:show, :update, :destroy]

    # get route for all products
    def index
        products = Product.all

        render json: {status: 'SUCCESS', message:'Loaded Products', data:products},status: :ok
    end




end