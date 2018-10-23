const aws = require('aws-sdk');
const s3 = new aws.S3();

const bucketName = process.env.BUCKET_NAME;

s3.listBuckets((err, data) => {
  if (err) {
    console.log('Error', err);
    process.exit(1);
  }

  if (data.Buckets.find(bucket => bucket.Name === bucketName)) {
    console.log(`Bucket "${bucketName}" already exists.`);
  } else {
    /**
    Warning: Adding "LocationConstraint" param will break for our region (us-east-1).
    But, "LocationConstraint" would be required for any other region.
    https://docs.aws.amazon.com/cli/latest/reference/s3api/create-bucket.html#examples
    **/
    const bucketParams = {
      Bucket: bucketName
    };

    s3.createBucket(bucketParams, (err, data) => {
      if (err) {
        console.log(`Bucket "${bucketName}" failed to build.`, err);
        process.exit(1);
      } else {
        console.log(`Bucket "${bucketName}" built in region ${data.Location}`);
      }
    });
  }
});
