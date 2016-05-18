class ReadingListsController < ApplicationController
  before_action :set_reading_list, only: [:show, :update, :destroy]

  def index
    @reading_lists = ReadingList.all
  end

  def show
  end

  def new
    @reading_list = ReadingList.new
  end

  def edit
    @reading_list = ReadingList.first
  end

  def create
    @reading_list = ReadingList.new(reading_list_params)

    if @reading_list.save
      redirect_to @reading_list, notice: 'Reading list was successfully created.'
    else
      render :new
    end
  end

  def update
    if @reading_list.update(reading_list_params)
      redirect_to "/reading-list", notice: 'Reading list was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @reading_list.destroy
    redirect_to reading_lists_url, notice: 'Reading list was successfully destroyed.'
  end

  private
    def set_reading_list
      @reading_list = ReadingList.find(params[:id])
    end

    def reading_list_params
      params.require(:reading_list).permit(:body)
    end
end
