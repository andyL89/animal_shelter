class DetailsController < ApplicationController
  swagger_controller :details, "Animal Details of a Specific Animal Type"

  swagger_api :index do
    summary "Fetches all animals of a specific animal type"
    notes "This lists all the animals of a specific animal type"
    param :path, :animal_id, :integer, :required, "Animal Id"
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
    param :path, :id, :integer, :required, "id"
    response :ok, "Success"
    response :not_found
    response :unprocessable_entity, "An animal with that id does not match the animal id."
  end
  def show
    @animal = Animal.find(params[:animal_id])
    @detail = Detail.find(params[:id])
    if @detail.animal_id == @animal.id
      json_response(@detail)
    else
      render status: 404, json: {
        message: "An animal with that id does not match the animal id."
      }
    end
  end

  swagger_api :random do
    summary "Fetches a random animal's details"
    notes "Fetches a single random animal's details"
    response :ok, "Success"
    response :not_found
    response :unprocessable_entity
  end
  def random
    ids = Animal.pluck(:id)
    @random_animal = Animal.find(ids.sample)
    @random_detail = @random_animal.details.sample
    json_response(@random_detail)
  end

  swagger_api :create do
    summary "Creates a new animal's details"
    notes "Check for corresponding animal ids for animal types by looking in 'get/animals' below."
    param :path, :animal_id, :integer, :required, "Animal id"
    param :form, :name, :string, :required, "Name"
    param :form, :breed, :string, :required, "Breed"
    param :form, :sex, :string, :required, "Sex"
    param :form, :color, :string, :required, "Color"
    param :form, :age, :integer, :required, "Age"
    param :form, :weight, :integer, :required, "Weight(lbs)"
    param :form, :bio, :integer, :required, "Bio"
    response :ok, "Success"
    response :not_found
    response :unprocessable_entity
  end
  def create
    @detail = Detail.create!(detail_params)
    json_response(@detail, :created)
  end

  swagger_api :update do
    summary "Updates an existing animal's details"
    param :path, :animal_id, :integer, :required, "Animal id"
    param :path, :id, :integer, :required, "id"
    param :form, :name, :string, :required, "Name"
    param :form, :breed, :string, :required, "Breed"
    param :form, :sex, :string, :required, "Sex"
    param :form, :color, :string, :required, "Color"
    param :form, :age, :integer, :required, "Age"
    param :form, :weight, :integer, :required, "Weight(lbs)"
    param :form, :bio, :integer, :required, "Bio"
    response :ok, "This animal's details have been updated successfully."
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
    summary "Deletes an existing animal's details"
    param :path, :animal_id, :integer, :required, "Animal id"
    param :path, :id, :integer, :required, "id"
    response :ok, "This animal's details have been deleted successfully."
    response :not_found
    response :unprocessable_entity
  end
  def destroy
    @detail = Detail.find(params[:id])
    if @detail.destroy!
      render status: 200, json: {
        message: "This animal's details have been deleted successfully."
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