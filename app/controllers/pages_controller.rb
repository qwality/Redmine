class PagesController < ApplicationController
  skip_load_and_authorize_resource only: [:home, :search]

  def search
    @query = params.dig(:search, :query) || "dsds"
    @model = params.dig(:search, :model) || "User"
    @attribute = params.dig(:search, :attribute) || "first_name"

    # @q = params[:search][:query]

    @query = {"#{@attribute}_cont" => @query}

    @params = params

    @allowed_attributes = {
      User.name => User.ransackable_attributes,
      Task.name => Task.ransackable_attributes,
      Project.name => Project.ransackable_attributes
    }

    begin
      model = @model.classify.constantize

      @result = model.ransack(@query).result(distinct: true)
    rescue StandardError => e
      flash[:error] = "An error occurred: #{e.message}"
      @result = []
    end
  end
end
