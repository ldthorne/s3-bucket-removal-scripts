## AWS S3 Automated Bucket Removal

### This repo contains two scripts, `find_s3_buckets.rb` and `remove_s3_buckets.rb`, and creates a text file, `buckets_to_delete.txt`:
---
#### find_s3_buckets.rb
This script finds all the S3 buckets for a given account and writes them to `buckets_to_delete.txt`. To run the file, you must set your `ACCESS_KEY_ID` and your `SECRET_ACCESS_KEY`. I do this by setting those as environment variables, but you can also hardcode them if that's your preference. You're also able to exclude buckets you know you don't want to delete by adding their names in the `BUCKETS_NOT_TO_DELETE` constant.

#### buckets_to_delete.txt
Once you've found all your buckets, now you get to go through and audit this file to ensure that only the buckets you want to delete are in this file. If you find a bucket in there that you don't want deleted, just delete its line. Make sure that you're confident in the list, as you cannot restore deleted buckets.

#### remove_s3_buckets.rb
This script will loop over all the bucket names in `buckets_to_delete.txt` and then find the bucket in s3, delete its contents (all the objects inside of it) and then delete the bucket itself.
