class ProjectsController < ApplicationController

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to project_path(@project)
    else
      # TODO
    end
  end

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def show
    @project = Project.find(params[:id])
    @floorplans = @project.floorplans
  end

private

  def project_params
    params.require(:project).permit(:name)
  end

end
