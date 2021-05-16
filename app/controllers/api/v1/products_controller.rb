class::Api::V1::ProductsController < ApplicationController


    def index
        products = Product.all

        render json: {status: 'SUCCESS', message:'Loaded Products', data:products},status: :ok
    end


end