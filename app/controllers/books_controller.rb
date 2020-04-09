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
        render json: @@data
    end

    #Update a book
    def update
        puts book_params
        @@data[params[:id].to_i].merge!(book_params)
        render json: @@data
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

    def book_params
        params.require(:book).permit(:title, :author)
    end
end