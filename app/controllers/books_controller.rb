class BooksController < ApplicationController
    skip_before_action :verify_authenticity_token

    @@data = [
        { title: "Harry Potter", author: "J.K Rowling" },
        { title: "Name of the wind", author: "Patrick Rothfuss" }
    ]

    def index
        render json: @@data
    end

    #Show a single book
    def show
        render json: @@data[params[:id].to_i]
    end

    #Create a new book
    def create
        @@data.push(params[:book])
        # render plain: @@data[@@data.length - 1]
        render json: @@data
    end

    #Update a book
    def update
        @@data[params[:id].to_i] = {title: params[:title], author: params[:author]}
        # render json: @@data[params[:id].to_i]
        render plain: params
    end

    #Remove a book
    def destroy
        render plain: "#{params[:id]} is removed"
        @@data.delete_at(params[:id].to_i)
    end

    private
    def setup_data
        @@data = [
            { title: "Harry Potter", author: "J.K Rowling" },
            { title: "Name of the wind", author: "Patrick Rothfuss" }
        ]
    end
end