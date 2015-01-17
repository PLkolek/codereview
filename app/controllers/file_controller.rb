class FileController < ApplicationController
  def index
    respond_to do |format|
      format.json { render :json => GetDiff.new.call(1) }
    end
  end
  def showMore
    logger.debug(show_more_params)
    respond_to do |format|
      format.json { render :json =>
                               ShowMore.new.call(
                                   show_more_params[:from],
                                   show_more_params[:to],
                                   show_more_params[:old_new_difference]) }
    end
  end

  private
  def show_more_params
    params.require(:file).permit(:from, :to, :old_new_difference)
  end

end
