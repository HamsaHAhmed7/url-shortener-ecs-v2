# src/ddb.py
import boto3
import os

TABLE_NAME = os.getenv("TABLE_NAME", "urlshortener")
ENDPOINT_URL = os.getenv("AWS_ENDPOINT_URL")  # LocalStack or AWS
REGION = os.getenv("AWS_REGION", "us-east-1")

# DynamoDB client
dynamodb = boto3.client(
    "dynamodb",
    endpoint_url=ENDPOINT_URL,
    region_name=REGION
)

def put_mapping(short_id: str, url: str):
    dynamodb.put_item(
        TableName=TABLE_NAME,
        Item={
            "id": {"S": short_id},
            "url": {"S": url}
        }
    )

def get_mapping(short_id: str):
    resp = dynamodb.get_item(
        TableName=TABLE_NAME,
        Key={"id": {"S": short_id}}
    )
    if "Item" in resp:
        return {"id": short_id, "url": resp["Item"]["url"]["S"]}
    return None
