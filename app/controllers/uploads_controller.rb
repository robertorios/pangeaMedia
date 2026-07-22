# app/controllers/uploads_controller.rb
class UploadsController < ApplicationController
  before_action :authenticate_user!

  def presign
    # Credentials come from ENV only. Never hardcode AWS keys in source —
    # anything committed here is compromised and must be rotated.
    region = ENV["AWS_REGION"].presence
    access_key = ENV["AWS_ACCESS_KEY_ID"].presence
    secret = ENV["AWS_SECRET_ACCESS_KEY"].presence
    bucket = ENV["AWS_BUCKET"].presence

    missing = []
    missing << "AWS_REGION" unless region
    missing << "AWS_ACCESS_KEY_ID" unless access_key
    missing << "AWS_SECRET_ACCESS_KEY" unless secret
    missing << "AWS_BUCKET" unless bucket

    if missing.any?
      return render json: {
        error: "S3 presign is not configured. Set in .env: #{missing.join(', ')}. " \
               "On a laptop, explicit keys are required; the EC2 metadata service is not available."
      }, status: :unprocessable_entity
    end

    s3 = Aws::S3::Resource.new(
      region: region,
      access_key_id: access_key,
      secret_access_key: secret
    )

    obj = s3.bucket(bucket).object(params[:filename].to_s)

    url = obj.presigned_url(:put, expires_in: 300, content_type: params[:content_type])

    render json: {
      upload_url: url,
      file_url: obj.public_url
    }
  end
end
   