class::Api::V1::ProductsController < ApplicationController

    # GET for all products
    def index
        products = Product.all

        render json: {status: 'SUCCESS', message:'Loaded Products', data:products},status: :ok
    end

    # GET product by sku
    def show
        # query for the product with the matching sku
        product = Product.where(sku: params[:id])

        # check if there was an object successfully returned or not
        if product.empty?
            render json: {status: 'ERROR', message:'No product exists with this sku', data:product},status: :unprocessable_entity
        else
            render json: {status: 'SUCCESS', message:'Loaded product with specified sku', data:product},status: :ok
        end
    end

    # POST for a new product
    def create
        product = Product.new(product_params)

        # check if saved correctly
        if product.save
            render json: {status: 'SUCCESS', message:'Added the new product', data:product},status: :ok
        else
            render json: {status: 'ERROR', message:'Could not add the new product', data:store},status: :unprocessable_entity
        end
    end



    private
    # only allow trusted params through
    def product_params
        params.permit(:product_name, :sku, :inventory_quantity, :store_id)
    end

end
