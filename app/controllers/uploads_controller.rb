# app/controllers/uploads_controller.rb
class UploadsController < ApplicationController
    def presign
        # binding.pry
      s3 = Aws::S3::Resource.new(
        region: ENV['AWS_REGION'],
        access_key_id: ENV['AWS_ACCESS_KEY_ID'],
        secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
      )
  
      obj = s3.bucket(ENV['AWS_BUCKET']).object("#{params[:filename]}")
  
      url = obj.presigned_url(:put, expires_in: 300, content_type: params[:content_type])
  
      render json: {
        upload_url: url,
        file_url: obj.public_url # or use obj.key and store it in DB
      }
    end
  end
  