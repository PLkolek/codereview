class FileController < ApplicationController
  def index
    respond_to do |format|
      format.json { render :json => [{:no => 1, :text => "aaa", :type => :no_changes, :comment => ''},
                                     {:no => 2, :text => "bbb", :type => :no_changes, :comment => ''},
                                     {:no => 3, :text => "ccc", :type => :no_changes, :comment => ''},
                                     {:no => 4, :text => "Those lines were removed", :type => :removed, :comment => ''},
                                     {:no => 5, :text => "Seriously", :type => :removed, :comment => ''},
                                     {:no => 6, :text => "And this one was added", :type => :added, :comment => ''}]
                  }
    end
  end
end
