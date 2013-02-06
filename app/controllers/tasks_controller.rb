class TasksController < ApplicationController

  def index
    @tasks = @client.tasks.created
    render :json => @tasks
  end

  def start
    @task = Task.find params[:id]
    if @task.start
      head :no_content
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  def complete
    @task = Task.find params[:id]
    if @task.update_attributes(result: params[:result])
      @task.complete!
      head :no_content
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

end