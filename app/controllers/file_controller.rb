class FileController < ApplicationController
  def index
    respond_to do |format|
      format.json { render :json => GetDiff.new.call }
    end
  end
  def showMore
    respond_to do |format|
      format.json { render :json => [{:no => 4, :text => "Old line", :type => :no_changes, :comment => ''},
                                     {:no => 5, :text => "Also old line", :type => :no_changes, :comment => ''},
                                     {:no => 6, :text => "Another old line", :type => :no_changes, :comment => ''},
                                     {:no => 7, :text => "Another old line", :type => :no_changes, :comment => ''},
                                     {:no => 8, :text => "Another old line", :type => :no_changes, :comment => ''}]
      }
    end
  end
end
