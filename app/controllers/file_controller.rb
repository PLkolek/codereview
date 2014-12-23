class FileController < ApplicationController
  def index
    respond_to do |format|
      format.json { render :json => [{
                                         :lines => "aaa\nbbb\nccc\n",
                                         :type => :no_changes
                                     },
                                     {
                                         :lines => "Those lines were removed\nSeriously\n",
                                         :type => :removed
                                     },
                                     {
                                         :lines => "And this one was added",
                                         :type => :added
                                     }]
                  }
    end
  end
end
