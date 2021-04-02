class AnimalsController < ApplicationController
  swagger_controller :animals, "Animal Types"

  swagger_api :index do
    summary "Fetches all animal types"
    notes "This lists all the animal types with their corresponding IDs"
    response :ok, "Success"
    response :not_found
    response :unprocessable_entity
  end
  def index
    @animals = Animal.all
    json_response(@animals)
  end

  swagger_api :show do
    summary "Fetches a single animal type"
    notes "This shows a single animal type with its corresponding ID"
    param :path, :id, :integer, :required, "Animal Id"
    response :ok, "Success"
    response :not_found
    response :unprocessable_entity
  end
  def show
    @animal = Animal.find(params[:id])
    json_response(@animal)
  end

  swagger_api :create do
    summary "Creates a new animal type"
    notes "example: 'cat', 'dog', 'bird', etc"
    param :form, :animal_type, :string, :required, "Animal Type"
    response :ok, "Success"
    response :not_found
    response :unprocessable_entity
  end
  def create
    @animal = Animal.create!(animal_params)
    json_response(@animal, :created)
  end

  swagger_api :update do
    summary "Updates an existing animal type"
    notes "example: 'cta' => 'cat'"
    param :path, :id, :integer, :required, "Destination Id"
    param :form, :animal_type, :string, :optional, "Animal Type"
    response :ok, "This destination has been updated successfully."
    response :not_found
    response :unprocessable_entity, "Validation failed: Country can't be blank, City can't be blank"
  end
  def update
    @animal = Animal.find(params[:id])
    if @animal.update!(animal_params)
      render status: 200, json: {
        message: "This animal type has been updated successfully."
      }
    end
  end

  swagger_api :destroy do
    summary "Deletes an existing animal type"
    param :path, :id, :integer, :optional, "Animal Id"
    response :ok, "This animal type has been removed successfully."
    response :not_found
    response :unprocessable_entity
  end
  def destroy
    @animal = Animal.find(params[:id])
    if @animal.destroy!
      render status: 200, json: {
        message: "This animal type has been removed successfully."
      }
    end
  end

  private
  def json_response(object, status = :ok)
    render json: object, status: status
  end

  def animal_params
    params.permit(:animal_type)
  end
end