terraform {
  backend "s3" {
    bucket = "lgaclabs-compute"
    key    = "lgaclabs-compute/tf.state"
    region = "sa-east-1"
  }

}

