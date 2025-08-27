class AddApprovalStatusAndApprovedByToMedia < ActiveRecord::Migration[8.0]
  def change
    add_column :media, :approval_status, :string
    add_column :media, :approved_by, :integer
  end
end
