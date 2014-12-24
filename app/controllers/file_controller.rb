class FileController < ApplicationController
  def index
    respond_to do |format|
      format.json { render :json => [{:text => "aaa", :type => :no_changes},
                                     {:text => "bbb", :type => :no_changes},
                                     {:text => "ccc", :type => :no_changes},
                                     {:text => "Those lines were removed", :type => :removed},
                                     {:text => "Seriously", :type => :removed},
                                     {:text => "And this one was added", :type => :added}]
                  }
    end
  end
end
