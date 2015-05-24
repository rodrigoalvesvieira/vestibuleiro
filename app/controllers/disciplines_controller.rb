class DisciplinesController < ApplicationController

  def index
    @disciplines = Discipline.all
  end

  def show
    @discipline = Discipline.find params[:id]
  end
end
