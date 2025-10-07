# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :node, Types::NodeType, null: true, description: "Fetches an object given its ID." do
      argument :id, ID, required: true, description: "ID of the object."
    end

    def node(id:)
      context.schema.object_from_id(id, context)
    end

    field :nodes, [Types::NodeType, null: true], null: true, description: "Fetches a list of objects given a list of IDs." do
      argument :ids, [ID], required: true, description: "IDs of the object."
    end

    def nodes(ids:)
      ids.map { |id| context.schema.object_from_id(id, context) }
    end

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World!"
    end

    field :medias, [Types::MediaType], null: false do
      argument :filter, Types::MediaFilterInput, required: false, description: "Filter media by various criteria"
    end

    def medias(filter: nil)
      scope = Media.all
      
      if filter
        scope = scope.where(approval_status: filter[:approval_status]) if filter[:approval_status].present?
        scope = scope.where(media_type: filter[:media_type]) if filter[:media_type].present?
        scope = scope.where(user_id: filter[:user_id]) if filter[:user_id].present?
      end
      
      scope
    end
  end
end
