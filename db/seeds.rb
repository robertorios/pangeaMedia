# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "Creating sample media records..."

# Sample Video 1
Media.find_or_create_by!(title: 'Sample Video 1') do |media|
  media.description = 'This is a sample video for testing GraphQL queries'
  media.media_url = 'https://example.com/sample-video-1.mp4'
  media.media_type = 'video'
  media.visibility = 'public'
  media.user_id = 1
  media.approval_status = 'pending'
  media.approved_by = 1
end

# Sample Audio 1
Media.find_or_create_by!(title: 'Sample Audio 1') do |media|
  media.description = 'This is a sample audio file for testing'
  media.media_url = 'https://example.com/sample-audio-1.mp3'
  media.media_type = 'audio'
  media.visibility = 'private'
  media.user_id = 1
  media.approval_status = 'pending'
  media.approved_by = 1
end

# Sample Text 1
Media.find_or_create_by!(title: 'Sample Text 1') do |media|
  media.description = 'This is a sample text document for testing'
  media.media_url = 'https://example.com/sample-text-1.txt'
  media.media_type = 'text'
  media.visibility = 'public'
  media.user_id = 1
  media.approval_status = 'pending'
  media.approved_by = 1
end

puts "Sample media records created successfully!"