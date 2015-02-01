class CommitController < ApplicationController

  def index
    respond_to do |format|
      format.json { render :json => Commit.find(commit_params) }
    end
  end

  private
  def commit_params
    params.permit(:url, :title, :author)
  end
end