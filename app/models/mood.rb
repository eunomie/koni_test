class Mood < ApplicationRecord
  enum feeling: {
                 good: 'good',
                 ordinary: 'ordinary',
                 bad: 'bad'
                }
end
