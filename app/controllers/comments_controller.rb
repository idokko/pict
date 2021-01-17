class CommentsController < ApplicationController
    def new
      @topic = Topic.find(params[:topic_id])
      @comment = @topic.comments.new
    end
    
    # def index
    #     @comment_topics = current_user.comment_topics
    # end
    
    def create
      topic = Topic.find(params[:topic_id])
      @comment = topic.comments.new(comment_params)
      @comment.user_id = current_user.id
      # @comment = current_user.comments.new(comment_params)
      # topic = Topic.find(params[:topic_id])
      # @comment.topic_id = topic.id
      
      # binding.pry
      if @comment.save
          redirect_to topics_path, success: 'コメントしました'
      else
        @topic = Topic.find(params[:topic_id])
        flash.now[:danger] = "コメントできませんでした"
        # render :new
        render 'comments/new', id: params[:topic_id]
      end
    end
    
    private
    def comment_params
      params.require(:comment).permit(:body) 
    end
end
