const aws = require('aws-sdk');
const s3 = new aws.S3();

const bucketName = process.env.BUCKET_NAME;

s3.listBuckets()
.then((data) => {
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
    return s3.createBucket(bucketParams)
    .then(() => {
      console.log(`Bucket "${bucketName}" built in region ${data.Location}`);
    })
  }
})
.catch((err) => {
  console.error(err);
  process.exit(1);
})
