require 'aws-sdk'

File.open('buckets_to_delete.txt').each do |bucket_name|
  bucket_name.strip!
  p "DELETING #{bucket.name}"
  bucket = Aws::S3::Bucket.new(bucket_name)
  bucket.delete!
end

