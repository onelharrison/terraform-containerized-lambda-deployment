import json
import random


def scramble(text: str) -> str:
    return "".join(random.sample(text, len(text)))


def handler(event, context):
    return {
        "statusCode": 200,
        "headers": {"Content-Type": "application/json"},
        "body": json.dumps({"result": scramble(event["text"])}),
    }


if __name__ == "__main__":
    pass
