require 'aws-sdk'

BUCKETS_NOT_TO_DELETE = ['app.hicommon.com', 'cmn-heroku-backups', 'careers.hicommon.com', 
  'cmn-rds-dumps', 'cmn.tmp', 'cmn.videos', 'cmn.wp.backup',
  'cmnstg-master', 'common-ssl-certs', 'common.com', 
  'elasticbeanstalk-us-east-1-691242311077', 'elasticbeanstalk-us-west-2-691242311077',
  'hicommon.com', 'logs.hicommon.com', 'skylight-neighborhoods-data', 'ssh.keys',
  'staging-two.hicommon.com', 'staging.hicommon.com', 'www.common.com', 'www.hicommon.com',
]

s3 = Aws::S3::Client.new

bucket_names = s3.list_buckets.buckets.map(&:name)
File.open('buckets_to_delete.txt', 'w+') do |f|
  bucket_names.each do |name|
    unless BUCKETS_NOT_TO_DELETE.include? name
      f.puts(name)
    end
  end
end