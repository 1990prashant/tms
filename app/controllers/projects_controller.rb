class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy, :add_developer, :add_todo, :update_todos]
  include Autherization

  # GET /projects
  # GET /projects.json
  def index
    @projects = current_user.projects
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @developers = @project.developers.where(project_developers: { is_creator: false })
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # GET /projects/1/add_developer
  def add_developer
    @developers = User.joins(:roles).where(roles: { name: "developer" })
  end

  # GET /projects/1/add_todo
  def add_todo
    @todos = @project.todos
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)
    @project.project_developers.new(developer_id: current_user.id, is_creator: true)
    respond_to do |format|
      if @project.save
        format.html { redirect_to add_developer_project_url(@project), notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      debugger
      if @project.update(project_params)
        format.html { redirect_to projects_url, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /projects/1/update_todos
  def update_todos
    params[:todos].each do |list|
      todo = @project.todos.find_by_id(list[:id])
      todo.update_attribute(:developer_id, list[:developer_id])
    end
    respond_to do |format|
      format.html { redirect_to @project, notice: 'Todos assigned successfully' }
      format.json { render :show, status: :ok, location: @project }
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      id = params[:id] || params[:project_id]
      @project = Project.find(id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params[:project][:developer_ids] << current_user.id.to_s if params[:project].present? && params[:project][:developer_ids].present?
      params.require(:project).permit(:name, :description, developer_ids: [], todos_attributes: [:id, :title, :description, :_destroy])
    end
end
