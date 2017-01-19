require 'aws/s3'

AWS::S3::Base.establish_connection!(
  :access_key_id     => ENV['ACCESS_KEY_ID'], 
  :secret_access_key => ENV['SECRECT_ACCESS_KEY']
)

File.open('buckets_to_delete.txt').each do |bucket_name|
  bucket_name.strip!
  bucket = AWS::S3::Bucket.find(bucket_name)
  p 'DELETING', bucket.name

  while(!bucket.empty?)
    begin
      puts "Deleting objects in bucket"

      bucket.objects.each do |object|
        object.delete
        puts "There are #{bucket.objects.size} objects left in the bucket"
      end

      puts "Done deleting objects"

    rescue SocketError
      puts "Had socket error"
    end

  end

  bucket.delete
end

