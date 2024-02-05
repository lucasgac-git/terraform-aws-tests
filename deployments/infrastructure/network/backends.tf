terraform {
  backend "s3" {
    bucket = "lgaclabs-networking"
    key    = "lgaclabs-networking/tf.state"
    region = "sa-east-1"
  }

}