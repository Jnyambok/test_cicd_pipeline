terraform {
  backend "s3" {
    bucket = "mystatebucket99"
    key = "state"   #the folder you want to store it in your bucket
    region = "eu-north-1"
    dynamodb_table = "mydynamotable"
  }

}