class ReviewController < ApplicationController
  def index
    respond_to do |format|
      format.json { render :json => Review.all }
    end
  end
end