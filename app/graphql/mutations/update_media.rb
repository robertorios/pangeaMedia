module Mutations
  class UpdateMedia < BaseMutation
    argument :id, ID, required: true
    argument :approval_status, String, required: false
    argument :chat_allowed, Boolean, required: false

    field :id, ID, null: false
    field :approval_status, String, null: true
    field :chat_allowed, Boolean, null: false

    def resolve(id:, approval_status: nil, chat_allowed: nil)
      media = Media.find(id)
      attrs = {}
      attrs[:approval_status] = approval_status unless approval_status.nil?
      attrs[:chat_allowed] = chat_allowed unless chat_allowed.nil?

      # Chat is only meaningful for approved media; clear the flag on reject.
      if attrs[:approval_status] == "rejected"
        attrs[:chat_allowed] = false
      end

      media.update!(attrs) if attrs.any?

      {
        id: media.id,
        approval_status: media.approval_status,
        chat_allowed: media.chat_allowed
      }
    end
  end
end
