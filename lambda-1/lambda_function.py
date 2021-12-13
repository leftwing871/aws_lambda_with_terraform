import json

def lambda_handler(event, context):
    
    print("cicd")
    print("cicd")
    print("cicd")
    
    print(json.dumps(event, indent=2))
    print(json.dumps(event, indent=2))

    return {
        'statusCode': 200,
        'body': json.dumps('Hello from Lambda!')
    }



