
class ProgressDataController < ApplicationController
    before_action :set_progress_datum, only: %i[show edit update destroy]
    before_action :authenticate_user!, except: [:index, :show]
  
    def index
        @chart_data = ProgressDatum.group_by_day(:date_time).sum(:progress)
        @progress_data = ProgressDatum.all
      end
  
    def new
      @progress_datum = ProgressDatum.new
    end
  
    def create
      @progress_datum = ProgressDatum.new(progress_datum_params)
      if @progress_datum.save
        redirect_to progress_data_path, notice: '進捗データが正常に作成されました。'
      else
        render :new
      end
    end
  
    def show
    end
  
    def edit
    end
  
    def update
      if @progress_datum.update(progress_datum_params)
        redirect_to progress_data_path, notice: '進捗データが正常に更新されました。'
      else
        render :edit
      end
    end

  
    def destroy
      @progress_datum.destroy
      redirect_to progress_data_path, notice: '進捗データが正常に削除されました。'
    end
  
    private
  
    def set_progress_datum
      @progress_datum = ProgressDatum.find(params[:id])
    end
  
    def progress_datum_params
      params.require(:progress_datum).permit(:user_id, :date_time, :progress, :comment)
    end
  end
  