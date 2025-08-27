class Media < ApplicationRecord
    validates :media_type, inclusion: { in: %w[video audio text] }
    validates :media_url, presence: true, format: URI::regexp(%w[http https])
  end
  
