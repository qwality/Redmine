class PagesController < ApplicationController
  skip_load_and_authorize_resource only: [:home, :search]

  def search
    @search = params[:search]
    @type = params[:type]

    model = @type.classify.constantize
    @result = model.ransack(@search).result(distinct: true)
  end
end
