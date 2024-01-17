class FilesController < ApplicationController
  def create_in_card
    render partial: 'files/create_file_card', locals: { file_index: params[:file_index]}
  end

  # def test_endpoint
  #   puts '.......................test endpoint.......................'
  #   puts params[:f].class, params[:f]
  #   # render partial: 'files/create_file_card', locals: { file_index: params[:file_index], f: params[:f]}
  #   render json: { file_index: params[:file_index], f: params[:f]}
  # end
  #
end