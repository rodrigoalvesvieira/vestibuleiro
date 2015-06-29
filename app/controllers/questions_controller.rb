class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :update_analytics, :destroy, :create_answer]
  before_filter :authenticate_user!, except: [:index, :show, :new, :update_analytics, :search]

  # GET /questions
  def index
    @last_questions = Question.order_by(:created_at.desc).page(1).per(10)
    @upvotes_questions = Question.all.sort{ |a,b| b.analytics.upvotes <=> a.analytics.upvotes } #Question.analytics.order_by(:upvotes.desc).page(1).per(10)
    @visualizations_questions = Question.all.sort{ |a,b| b.analytics.visualizations <=> a.analytics.visualizations } #Question.analytics.order_by(:visualizations).page(1).(10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @questions }
    end
  end

  def search
    @results = Set.new

    @results.add Answer.search params[:search_term]
    @results.add Question.search params[:search_term]

    return @results.to_a
  end

  def filterByTag
    @results_tag = Set.new
    @results     = Set.new

    @results_tag.add Tag.search params[:tag_name]

    @results_tag = @results_tag.to_a

    @results_tag.each do |tag|
      @results.add Question.filterByTag params[:tag]
    end

    @results = @results.to_a
  end

  # GET /questions/1
  def show
    @new_answer = Answer.new

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @question }
    end
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  def create
    if current_user
      @question = Question.new(question_params)
      @question.user_id = current_user.id

      respond_to do |format|
        if @question.save
          format.html { redirect_to @question, notice: 'Question was successfully created.' }
          format.json { render json: @question, status: :created }
        else
          format.html { render action: 'new' }
          format.json { render json: @question.errors, status: :unprocessable_entity }
        end
      end
    else
      # TODO: write code to allow user to post before signing up or signing in
      redirect_to new_user_session_url
    end
  end

  def create_answer
    answer = @question.answers.new body: params[:answer][:body]
    answer.user_id = current_user.id
    cond1 = answer.save

    current_user.answers = current_user.answers+[answer]
    cond2 = current_user.save

    if cond1 && cond2
      redirect_to @question
    else
      # TODO: Notify the user that the operation has not been successful.
    end
  end

  def create_question_comment
  end

  def create_answer_comment
  end

  # PATCH/PUT /questions/1
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_analytics
    @question.increment_metadata params[:analytics]
  end

  # DELETE /questions/1
  def destroy
    @question.unpublish
    respond_to do |format|
      format.html { redirect_to questions_url }
      format.json { head :no_content }
    end
  end

  def get_next_page
    if params[:order_by] == 'visualizations'
      @questions = Question.analytics.order_by(:visualizations).page([:page]).(10)
    elsif params[:order_by] == "upvotes"
      @questions = Question.analytics.order_by(:upvotes.desc).page([:page]).per(10)
    elsif params
      @questions = Question.order_by(:created_at.desc).page(params[:page]).per(10)
    end
    render json: @questions
  end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_question
    @question = Question.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def question_params
    params.require(:question).permit(:title, :discipline, :body, :tags, :user_id, answer_attributes: [:body])
  end
end
