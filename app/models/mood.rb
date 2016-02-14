require 'date'

class Mood < ApplicationRecord
  enum feeling: {
                 good: 'good',
                 ordinary: 'ordinary',
                 bad: 'bad'
                }
  def initialize(params=nil)
    if params.nil?
      super
    else
      params[:feeling_at] = Date.today unless params.has_key?(:feeling_at)
      super(params)
    end
  end

  def self.group_by_day_and_feeling_until_yesterday
    hash = {}
    Mood.where("feeling_at < ?", Date.today).group_by(&:feeling_at).each do |day, moods|
      hash[day] = {
                   'good'=>[], 'ordinary'=>[], 'bad'=>[]
                  }.merge(moods.group_by { |mood| mood.feeling })
    end
    hash
  end

  def self.value_by_days_until_yesterday
    values = {}
    group_by_day_and_feeling_until_yesterday.each do |day, moods|
      goods = moods['good'].count
      bads = moods['bad'].count
      ordinaries = moods['ordinary'].count
      values[day] = 10 * (goods - bads) / (goods + bads + ordinaries)
    end
    values
  end
end
