class MoodsController < ApplicationController
  # GET /moods
  # GET /moods.json
  def index
    @mood = Mood.new
    @moods_values = Mood.value_by_days_until_yesterday
  end

  def details
    @moods_by_day = Mood.group_by_day_and_feeling_until_yesterday
  end

  # GET /moods/new
  def new
    @mood = Mood.new
  end

  # POST /moods
  # POST /moods.json
  def create
    @mood = Mood.new(mood_params)

    respond_to do |format|
      if @mood.save
        format.html { redirect_to :back, notice: 'Mood was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def mood_params
      #params.fetch(:mood, {})
      params.require(:mood).permit(:feeling)
    end
end
