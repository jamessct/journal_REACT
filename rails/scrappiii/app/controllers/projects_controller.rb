class ProjectsController < ApplicationController
  def index
    projects = Project.all
    render :json => projects.as_json(include: [:entries => { include: [:photo, :comment], except: [:updated_at, :created_at]}], except: [:updated_at, :created_at]) 
  end

  def show
    project = Project.find(params[:id])
    render :json => project.as_json(include: [:entries ])
  end

  def create
    project = Project.create(project_params)
    render :json => project
  end

  def update
    project = Project.find(params[:id])
    if project.update_attributes(project_params)
      render :json => project
    else
      render :json => [status: :update_failed]
    end
  end

  def destroy
    project = Project.find(params[:id])
    if project.destroy!
      render :json => { status: :success }
    else
      render :json => { status: :delete_failed}
    end
  end

  def project_params
    params.require(:project).permit([:title, :summary, :author])
  end
end