module Mutations
    class UpdateMedia < BaseMutation
      argument :id, ID, required: true
      argument :approval_status, String, required: false
  
      field :id, ID, null: false
      field :approval_status, String, null: true
  
      def resolve(id:, approval_status:)
        media = Media.find(id)
        media.update(approval_status: approval_status)
        {
          id: media.id,
          approval_status: media.approval_status
        }
      end
    end
  end
  