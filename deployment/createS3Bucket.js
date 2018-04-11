const bucketName = process.argv[2];

const aws = require('aws-sdk');

s3 = new aws.S3();

s3.listBuckets((err, data) => {
  if (err) {
    console.log('Error', err);
    return;
  }

  if (data.Buckets.find(bucket => bucket.Name === bucketName)) return;

  const bucketParams = {
    Bucket: bucketName,
  };

  s3.createBucket(bucketParams, (err, data) => {
    if (err) {
      console.log('Error', err);
    } else {
      console.log('Success', data.Location);
    }
  });
});
