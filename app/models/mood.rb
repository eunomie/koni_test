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

  def self.count_by_days
    hash = {}
    Mood.all.group_by(&:feeling_at).each do |day, moods|
      hash[day] = {
                   'good'=>[], 'ordinary'=>[], 'bad'=>[]
                  }.merge(moods.group_by { |mood| mood.feeling })
    end
    hash
  end
end
