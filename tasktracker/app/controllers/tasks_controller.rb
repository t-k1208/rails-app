class TasksController < ApplicationController
  before_action :set_task, only: [:edit, :update, :destroy]
  before_action :authenticate_user!



  def index
    if params[:search].present?
      @tasks = Task.where("title LIKE ?", "%#{params[:search]}%")
    else
      @tasks = Task.all
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      # 新しい進捗度を作成
      @task.progresses.create(progress: params[:task][:progress], comment: params[:task][:comment], date: params[:task][:date])
      redirect_to tasks_path, notice: 'タスクが正常に作成されました。'
    else
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: 'タスクが正常に更新されました。'
    else
      render :edit
    end
  end

  # def destroy
  #   @task = Task.find(params[:id])
  #   @task.destroy
  #   redirect_to tasks_path, notice: 'タスクが削除されました。'
  # end
  def destroy
    @task.progresses.destroy_all
    @task.destroy
    redirect_to tasks_path
  end
  


  def show
    @task = Task.find_by(id: params[:id])
    if @task.nil?
      redirect_to tasks_path, notice: 'タスクが見つかりませんでした。'
    end
  end

  def detail
    @task = Task.find(params[:id])
  end

  def update_progress
    @task = Task.find(params[:id])
    
    # 既存の進捗度を保存
    previous_progress = @task.progress

    # 新しい進捗度を作成
    @task.progresses.create(progress: params[:task][:progress], comment: params[:task][:comment], date: params[:task][:date])

    # タスクの進捗度を更新
    @task.update(progress: params[:task][:progress], comment: params[:task][:comment], date: params[:task][:date])

    respond_to do |format|
      format.html { redirect_to detail_task_path(@task) }
      format.js { render :update_progress }
    end
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :progress, :comment, :date, :user_id)
  end
end