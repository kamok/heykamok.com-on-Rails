class ReadingListsController < ApplicationController
  before_action :set_reading_list, only: [:edit, :update]

  def edit
  end

  def update

    if @reading_list.update(reading_list_params)
      redirect_to "/reading-list", notice: 'Reading list was successfully updated.'
    else
      render :edit
    end
  end

  private
    def set_reading_list
      @reading_list = ReadingList.first
    end

    def reading_list_params
      params.require(:reading_list).permit(:body)
    end
end
