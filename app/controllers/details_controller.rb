class DetailsController < ApplicationController
  swagger_controller :details, "Animal Details of a Specific Animal Type"

  swagger_api :index do
    summary "Fetches all animals of a specific animal type"
    notes "This lists all the animals of a specific animal type"
    param :path, :destination_id, :integer, :required, "Animal Id"
    response :ok, "Success"
    response :unauthorized
    response :not_acceptable, "The request you made is not acceptable"
  end
  def index
    animal = Animal.find(params[:animal_id])
    @details = animal.details
    json_response(@details)
  end

  swagger_api :show do
    summary "Fetches a single animal's details"
    param :path, :animal_id, :integer, :required, "Animal Id"
    param :path, :id, :integer, :required, "Detail Id"
    response :ok, "Success"
    response :not_found
    response :unprocessable_entity, "A detail with that id does not match the destination id."
  end
  def show
    @animal = Animal.find(params[:animal_id])
    @detail = Detail.find(params[:id])
    if @detail.animal_id == @animal.id
      json_response(@detail)
    else
      render status: 404, json: {
        message: "A specific animal with that id does not match the animal id."
      }
    end
  end

  swagger_api :create do
    summary "Creates a new detail"
    param :form, :author, :string, :required, "Author"
    param :form, :content, :string, :required, "Content"
    param :form, :rating, :integer, :required, "Rating, 1-5"
    response :ok, "Success"
    response :not_found
    response :unprocessable_entity
  end
  def create
    @detail = Detail.create!(detail_params)
    json_response(@detail, :created)
  end

  swagger_api :update do
    summary "Updates an existing detail"
    param :path, :destination_id, :integer, :required, "Destination Id"
    param :path, :id, :integer, :required, "detail Id"
    param :form, :author, :string, :optional, "Author"
    param :form, :content, :string, :optional, "Content"
    param :form, :rating, :integer, :optional, "Rating, 1-5"
    response :ok, "This detail has been updated successfully."
    response :not_found
    response :unprocessable_entity
  end
  def update
    @detail = Detail.find(params[:id])
    if @detail.update!(detail_params)
      render status: 200, json: {
        message: "This animal's details have been updated successfully."
      }
    end
  end

  swagger_api :destroy do
    summary "Deletes an existing detail"
    param :path, :destination_id, :integer, :required, "Destination Id"
    param :path, :id, :integer, :required, "detail Id"
    response :ok, "This detail has been deleted successfully."
    response :not_found
    response :unprocessable_entity
  end
  def destroy
    @detail = Detail.find(params[:id])
    if @detail.destroy!
      render status: 200, json: {
        message: "This specific animal has been removed successfully."
      }
    end
  end

  private
  def json_response(object, status = :ok)
    render json: object, status: status
  end

  def detail_params
    params.permit(:name, :breed, :sex, :color, :age, :weight, :bio, :animal_id)
  end
end