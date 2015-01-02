class FileController < ApplicationController
  def index
    parsed = DiffParser.parse(%x(svn diff -r 15826:15827 http://svn.wildfiregames.com/public/ps/trunk/source/))
    logger.debug(parsed.inspect)
    logger.debug(parsed.elements.last.inspect)
    logger.debug(parsed.elements.last.text_value)
    respond_to do |format|
      format.json { render :json => [{:no => 1, :text => "aaa", :type => :no_changes, :comment => ''},
                                     {:no => 2, :text => "bbb", :type => :no_changes, :comment => ''},
                                     {:no => 3, :text => "ccc", :type => :no_changes, :comment => ''},
                                     {:type => :more},
                                     {:no => 9, :text => "Those lines were removed", :type => :removed, :comment => ''},
                                     {:no => 10, :text => "Seriously", :type => :removed, :comment => ''},
                                     {:no => 11, :text => "And this one was added", :type => :added, :comment => ''},
                                     {:type => :more}]
                  }
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
