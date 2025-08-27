class Media < ApplicationRecord
    acts_as_paranoid

    belongs_to :reviewer, class_name: "User", foreign_key: "approved_by", optional: true
    validates :media_type, inclusion: { in: %w[video audio text] }
    validates :media_url, presence: true, format: URI::regexp(%w[http https])

    enum :approval_status, {
        pending: "pending",
        approved: "approved",
        rejected: "rejected"
      }

    # media.pending! to set status
    # media.approved? to check status
    # Media.rejected to fetch all rejected records
    # Make sure the approval_status column in your database is of type string, not integer.
  end
  
