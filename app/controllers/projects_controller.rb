class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:notice] = "Project has been created."
      redirect_to @project
  else
      flash.now[:error] = "Project could not be saved"
      render :new
  end


    def show
      @project =  Project.find(params[:id])
    end
  end

   def edit
      @project = Project.find(params[:id])
  end

  def update
      @project = Project.find(params[:id])

      if @project.update_attributes(params[:project])
          redirect_to @project, notice: 'Project was successfully updated.'
        else
          render:edit
      end
  end

  def destroy
    @project = Project.find(params[:id])
    if @project.destroy
      redirect_to @project, notice: 'Project was successfully deleted.'
    else
      render:edit
    end
  end

  private

  def project_params
    params.require(:project).permit(:name, :technologies_used)
  end

  private

  def set_project

  end
end
