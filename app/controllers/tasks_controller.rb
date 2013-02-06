class TasksController < ApplicationController
  before_filter :authenticate_client

  def index
    @tasks = @client.tasks.created
    render :json => @tasks
  end

  def update
    @task = Task.find params[:id]
    if @task.update_attributes(result: params[:result])
      @task.complete!
      head :no_content
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  private
    def authenticate_client
      @client = Client.find_by_keyword( params[:keyword] )
      render :status => :forbidden, :text => "Forbidden" unless @client
    end

end