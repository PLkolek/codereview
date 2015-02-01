class FileController < ApplicationController
  def index
    respond_to do |format|
      format.json { render :json => Review.find(index_params[:review_id]).files }
    end
  end
  def showMore
    logger.debug(show_more_params)
    respond_to do |format|
      format.json { render :json =>
                               Review.find(show_more_params[:review_id]).show_more(
                                   show_more_params[:file_name],
                                   show_more_params[:from].to_i,
                                   show_more_params[:to].to_i,
                                   show_more_params[:old_new_difference].to_i) }
    end
  end

  private
  def show_more_params
    params.permit(:from, :to, :old_new_difference, :file_name, :review_id)
  end

  def index_params
    params.permit(:review_id)
  end

end
