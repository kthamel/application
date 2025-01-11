import json
import boto3

s3_client = boto3.client('s3')

def lambda_handler(event, context):
    # Extract bucket name and object key from the event
    bucket_name = event['Records'][0]['s3']['bucket']['name']
    object_key = event['Records'][0]['s3']['object']['key']
    
    print(f"Processing file: {object_key} from bucket: {bucket_name}")
    
    try:
        # Example: Get the file from S3
        response = s3_client.get_object(Bucket=bucket_name, Key=object_key)
        file_content = response['Body'].read().decode('utf-8')

        # Here you can process the file, for example, print its content
        print(file_content)
        
        # Add your own logic, e.g., trigger another AWS service, write to a database, etc.

    except Exception as e:
        print(f"Error processing file {object_key} from bucket {bucket_name}: {str(e)}")
        raise e
