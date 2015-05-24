class DisciplinesController < ApplicationController

  def index
    @disciplines = Discipline.all
  end

  def show
    @discipline = Discipline.find params[:id]
  end

  def search_tag
    term = /#{params[:search_term]}/i
    @tags = Tag.where(title: term, tag_name: term, description: term)
  end
end
