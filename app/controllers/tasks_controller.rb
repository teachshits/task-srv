class TasksController < ApplicationController

  def index
    @tasks = @client.tasks.created
    render :json => @tasks
  end

  def start
    @task = Task.find params[:task]
    render json: @task.errors, status: :unprocessable_entity unless @task.start
    head :no_content
  end

  def complete
    @task = Task.find params[:task]
    render json: @task.errors, status: :unprocessable_entity unless @task.complete
    head :no_content
  end

end