class ReadingListsController < ApplicationController
  before_action :set_reading_list, only: [:show, :edit, :update, :destroy]

  # GET /reading_lists
  def index
    @reading_lists = ReadingList.all
  end

  # GET /reading_lists/1
  def show
  end

  # GET /reading_lists/new
  def new
    @reading_list = ReadingList.new
  end

  # GET /reading_lists/1/edit
  def edit
  end

  # POST /reading_lists
  def create
    @reading_list = ReadingList.new(reading_list_params)

    if @reading_list.save
      redirect_to @reading_list, notice: 'Reading list was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /reading_lists/1
  def update
    if @reading_list.update(reading_list_params)
      redirect_to @reading_list, notice: 'Reading list was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /reading_lists/1
  def destroy
    @reading_list.destroy
    redirect_to reading_lists_url, notice: 'Reading list was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reading_list
      @reading_list = ReadingList.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def reading_list_params
      params.require(:reading_list).permit(:body)
    end
end
