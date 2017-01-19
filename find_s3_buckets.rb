require 'aws/s3'

BUCKETS_NOT_TO_DELETE = []

AWS::S3::Base.establish_connection!(
  :access_key_id     => ENV['ACCESS_KEY_ID'], 
  :secret_access_key => ENV['SECRET_ACCESS_KEY']
)

buckets = AWS::S3::Bucket.list
File.open('buckets_to_delete.txt', 'w+') do |f|
  buckets.each do |bucket|
    unless BUCKETS_NOT_TO_DELETE.include? bucket.name
      f.puts(bucket.name)
    end
  end
end