class AnswersController < ApplicationController

  def upvote
    answer = Answer.find(params[:_id])
    sucess_upvote = false
    if !answer.is_voter(current_user)
      #redirect_to @question and return
      answer.analytics.increment current_user, visualizations: 0, upvotes: 1, downvotes: 0
      answer.add_voter(current_user)
      sucess_upvote = true
    end
    render json: {sucess: sucess_upvote, upvotes: answer.analytics.upvotes}
  end

  def downvote
    answer = Answer.find(params[:_id])
    sucess_downvote = false
    if !answer.is_voter(current_user)
      answer.analytics.increment current_user, visualizations: 0, upvotes: 0, downvotes: 1
      answer.add_voter(current_user)
      sucess_downvote = true
    end
    render json: {sucess: sucess_downvote, downvotes: answer.analytics.downvotes}
  end

end
