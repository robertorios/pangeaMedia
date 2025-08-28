module Types
    class MediaUpdateInput < Types::BaseInputObject
      graphql_name 'MediaUpdateInput'  # ✅ Must match frontend exactly
  
      argument :id, ID, required: true
      argument :approval_status, String, required: false
    end
  end
  