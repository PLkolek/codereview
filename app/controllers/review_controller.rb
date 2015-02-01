class ReviewController < ApplicationController
  def index
    respond_to do |format|
      format.json { render :json => Review.all }
    end
  end

  def create
    review = Review.new(url: review_params[:url], name: review_params[:name])
    revisions = review_params[:revisions].map { |number|
      Revision.new(number: number.to_i, review: review)
    }
    review.revisions=revisions
    review.save
    respond_to do |format|
      format.json { render :json => { id: review.id } }
    end
  end

  def delete
    Review.delete(params[:review_id])
    respond_to do |format|
      format.all { head :ok, content_type: 'text/html' }
    end
  end

  private
  def review_params
    params.permit(:url, :name, :revisions => [])
  end
end