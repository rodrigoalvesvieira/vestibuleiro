class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def ranking
    @disciplines = Discipline.all
    @users = User.all

    @users.to_a.sort { |user_first,user_second| (user_second.ranking_user) <=> (user_first.ranking_user) }
  end

  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def sort_teachers
    @teachers =  Array.new
    @users = User.all
    @users.each do |user|
      if user.role == "teacher"
        @teachers << user
      end
    end

    @sorted_teachers = @teachers.sort {|a,b| a.evaluate_teacher <=> b.evaluate_teacher}
    @sorted_teachers.reverse
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :school_year, :desired_course, :city, :avatar, :description, :facebook, :twitter, :linkedin)
    end
end
