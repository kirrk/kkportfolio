class ProjectsController < ApplicationController
  before_filter :set_project, only: [:show, :edit, :update, :destroy]
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
     respond_to do |format|
          format.html do
            if @project.save
              flash[:notice] = "Project has been created."
              redirect_to @project
            else
              flash[:alert] = "Project has not been created."
              render :action => "new"
            end
          end
          format.js do
            unless @project.save
              render text: @project.errors.full_messages.join,
               status: :unprocessable_entity
            end
        end
    end
  end

  def show
    @commentable = @project
    @comments = @commentable.comments
    @comment = Comment.new
  end

  def edit
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
    @project = Project.find(params[:id])

  end
end
