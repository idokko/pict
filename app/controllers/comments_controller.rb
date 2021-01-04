class CommentsController < ApplicationController
#     def new
#       @comment = Comment.new 
#     end
    
#     # def index
#     #     @comment_topics = current_user.comment_topics
#     # end
    
#     def create
#       @comment = Comment.new
#       @comment.user_id = current_user.id
#       @comment.topic_id = params[:topic_id]
       
#     #   binding.pry
#       if @comment.save
#           redirect_to topics_path, success: 'コメントしました'
#       else
#           flash.now[:danger] = "コメントできませんでした"
#           render :new
#       end
#     end
    
#     private
#         def comment_params
#           params.require(:comment).permit(:comment) 
#         end
# end
