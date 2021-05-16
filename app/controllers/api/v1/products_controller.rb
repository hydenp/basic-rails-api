class::Api::V1::ProductsController < ApplicationController

    # GET for all products
    def index
        products = Product.all

        render json: {status: 'SUCCESS', message:'Loaded Products', data:products},status: :ok
    end

    # GET all products associated with a specific store
    def show
        # query for the product with the matching sku
        product = Product.where(store_id: params[:id])

        # check if there was an object successfully returned or not
        if product.empty?
            render json: {status: 'ERROR', message:'This store_id does not exist', data:product},status: :unprocessable_entity
        else
            render json: {status: 'SUCCESS', message:'Loaded all products associated with this store_id', data:product},status: :ok
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

    # POST to create many new products
    def create_many
        @starter_products = []

        product_params[:starter_products].each do |product_data|
            @starter_products << Product.create(product_data)
        end

        render json: {status: 'SUCCESS', message:'Added multiple products', data:@starter_products},status: :ok
    end

    # PUT a specific product associated with a specific store
    def update

        product = Product.find(params[:id])

        if product.update(product_params)
            render json: {status: 'SUCCESS', message:'Product inventory updated', data:product},status: :ok
        else
            render json: {status: 'ERROR', message:'Could update the inventory', data:product},status: :unprocessable_entity
        end
    end

    private
    # only allow trusted params through
    def product_params
        params.permit(:product_name, :sku, :inventory_quantity, :store_id, starter_products: [:product_name, :sku, :inventory_quantity, :store_id])
    end

end
