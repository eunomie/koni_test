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
end
