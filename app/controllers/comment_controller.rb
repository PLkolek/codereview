class CommentController < ApplicationController
  def save
    comment = Comment.find_or_initialize_by comment_key_params
    comment.update(content: comment_params[:content]);
    respond_to do |format|
      format.all { head :ok, content_type: 'text/html' }
    end
  end

  def destroy
    Comment.destroy_all comment_key_params
    respond_to do |format|
      format.all { head :ok, content_type: 'text/html' }
    end
  end

  def comment_key_params
    {:old_no => comment_params[:old_no],
     :new_no => comment_params[:new_no],
     :file_name => comment_params[:file_name],
     :review_id => comment_params[:review_id]
    }
  end

  private
  def comment_params
    params.permit(:old_no, :new_no, :content, :file_name, :review_id)
  end

end