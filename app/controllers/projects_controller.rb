class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(params[:project])
    if @project.save
      flash[:notice] = "Project has been created."
      redirect_to @project
    else
      #TODO
    end

    def show
      @project = Project.find(params[:id])
    end
  end

  private

  def project_params
      params.require(:project).permit(:name, :technologies_used)

   end
end
