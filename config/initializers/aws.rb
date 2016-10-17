Aws.config.update({
  region: ENV.fetch('AWS_REGION'),
  credentials: Aws::Credentials.new(ENV['AWS_CLIENT_ID'], ENV['AWS_CLIENT_SECRET']),
})

S3_BUCKET = Aws::S3::Resource.new.bucket(ENV['S3_BUCKET'])
