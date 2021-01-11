class CommentsController < ApplicationController
    def new
      @topic = Topic.find(params[:topic_id])
      @comment = Comment.new
    end
    
    # def index
    #     @comment_topics = current_user.comment_topics
    # end
    
    def create
      @comment = current_user.comments.new(comment_params)
      @comment.user_id = current_user.id
      topic = Topic.find(params[:topic_id])
      @comment = topic.comments.new
       
       #binding.pry
      if @comment.save
          redirect_to topics_path, success: 'コメントしました'
      else
          flash.now[:danger] = "コメントできませんでした"
          render :new
      end
    end
    
    private
    def comment_params
      params.require(:comment).permit(:body) 
    end
end
