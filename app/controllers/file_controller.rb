class FileController < ApplicationController
  def index
    respond_to do |format|
      format.json { render :json => ['aaa', 'bbb', 'ccc']}
    end
  end
end
