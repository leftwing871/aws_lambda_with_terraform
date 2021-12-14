import json

def lambda_handler(event, context):
    
    print("empty code")

    return {
        'statusCode': 200,
        'body': json.dumps('Hello from Lambda!')
    }
