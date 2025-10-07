# frozen_string_literal: true

module Types
  class MediaFilterInput < Types::BaseInputObject
    argument :approval_status, String, required: false, description: "Filter by approval status"
    argument :media_type, String, required: false, description: "Filter by media type (video, audio, text)"
    argument :user_id, Integer, required: false, description: "Filter by user ID"
  end
end
