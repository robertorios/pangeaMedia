# frozen_string_literal: true

module Types
  class MediaType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: true
    field :description, String, null: true
    field :visibility, String, null: true
    field :media_url, String, null: true
    field :media_type, String, null: true
    field :user_id, Integer, null: true
    field :approval_status, String, null: true
    field :approved_by, Integer, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
