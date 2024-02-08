class PagesController < ApplicationController
  skip_load_and_authorize_resource only: [:home, :search]
  # load_and_authorize_resource only: [:search]

  def search

    @query = params.dig(:search, :query) || "dsds"
    @model = params.dig(:search, :model) || "User"
    @attribute = params.dig(:search, :attribute) || "first_name"

    # @params = params
    def get_attributes_for_js_by_model(model_str)
      lambda { |i| [t("activerecord.attributes.#{model_str.downcase}.#{i}"), i]}
    end

    model_to_model_attr_pair = ->(model) do
      [model.name, (model.ransackable_attributes - %w[created_at updated_at]).map(&get_attributes_for_js_by_model(model.name))]
    end

    @allowed_attributes = ([User, Task, Project].map(&model_to_model_attr_pair)).to_h

    # @allowed_attributes = {
    #   User.name => (User.ransackable_attributes - %w[created_at updated_at]).map(&get_attributes_for_js_by_model(User.name)),
    #   Task.name => (Task.ransackable_attributes - %w[created_at updated_at]).map(&get_attributes_for_js_by_model(Task.name)),
    #   Project.name => (Project.ransackable_attributes - %w[created_at updated_at]).map(&get_attributes_for_js_by_model(Project.name))
    # }
    # %w[User Task Project].map { |model| [t("#{model.downcase}s".to_s), model]}, @model

    begin
      model = @model.classify.constantize

      # unless can? :read, model
      #   @result = []
      #   return
      # end

      if model.column_for_attribute(@attribute).type == :string
        @query = {"#{@attribute}_cont" => @query}
      elsif model.column_for_attribute(@attribute).type == :integer
        @query = {"#{@attribute}_eq" => Task.states[@query]}
      end

      @result = model.ransack(@query).result(distinct: true).to_a

      @result.select! { |r| can? :read, r }

    rescue StandardError => e
      flash[:error] = "An error occurred: #{e.message}"
      # @query = {"#{@attribute}_cont" => @query}
      @result = []
    end
  end
end
