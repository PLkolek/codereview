class FileController < ApplicationController
  def index
    respond_to do |format|
      format.json { render :json => Review.find(1).chunks }
    end
  end
  def showMore
    logger.debug(show_more_params)
    respond_to do |format|
      format.json { render :json =>
                               Review.find(1).show_more(
                                   show_more_params[:from].to_i,
                                   show_more_params[:to].to_i,
                                   show_more_params[:old_new_difference].to_i) }
    end
  end

  private
  def show_more_params
    params.permit(:from, :to, :old_new_difference)
  end

end
