class FileController < ApplicationController
  def index
    respond_to do |format|
      format.json { render :json => GetDiff.new.call }
    end
  end
  def showMore
    logger.debug(show_more_params)
    respond_to do |format|
      format.json { render :json => ShowMore.new.call(show_more_params[:from], show_more_params[:to]) }
      #  [{:no => 4, :text => "Old line", :type => :no_changes, :comment => ''},
      #                                {:no => 5, :text => "Also old line", :type => :no_changes, :comment => ''},
      #                                {:no => 6, :text => "Another old line", :type => :no_changes, :comment => ''},
      #                                {:no => 7, :text => "Another old line", :type => :no_changes, :comment => ''},
      #                                {:no => 8, :text => "Another old line", :type => :no_changes, :comment => ''}]

    end
  end

  private
  def show_more_params
    params.require(:file).permit(:from, :to)
  end

end
