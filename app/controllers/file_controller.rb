class FileController < ApplicationController
  def index
    respond_to do |format|
      format.json { render :json => [{:text => "aaa", :type => :no_changes, :comment => ''},
                                     {:text => "bbb", :type => :no_changes, :comment => ''},
                                     {:text => "ccc", :type => :no_changes, :comment => ''},
                                     {:text => "Those lines were removed", :type => :removed, :comment => ''},
                                     {:text => "Seriously", :type => :removed, :comment => ''},
                                     {:text => "And this one was added", :type => :added, :comment => ''}]
                  }
    end
  end
end
