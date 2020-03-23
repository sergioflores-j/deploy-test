#!/usr/bin/env bash

AWS_ACCESS_KEY_ID=
AWS_SECRET_ACCESS_KEY=
AWS_REGION="sa-east-1"
AWS_STAGE=

if [ -z "$1" ] || [ -z "$2" ]; then
  echo "::error ::undefined params"
  exit 1
fi

if [[ "$1" == "stage" ]]; then
  echo "loading stage variables"

  AWS_ACCESS_KEY_ID=$(echo "$2" | jq -r ".STG_AWS_ACCESS_KEY_ID")
  AWS_SECRET_ACCESS_KEY=$(echo "$2" | jq -r ".STG_AWS_SECRET_ACCESS_KEY")
  AWS_STAGE=$(echo "stage")
elif [[ "$1" == "master" ]]; then
  echo "loading development variables"

  AWS_ACCESS_KEY_ID=$(echo "$2" | jq -r ".PRD_AWS_ACCESS_KEY_ID")
  AWS_SECRET_ACCESS_KEY=$(echo "$2" | jq -r ".PRD_AWS_SECRET_ACCESS_KEY")
  AWS_STAGE=$(echo "api")
else
  echo "::error ::invalid branch"
  exit 1
fi

if [ -z "$AWS_ACCESS_KEY_ID" ] || [ -z "$AWS_SECRET_ACCESS_KEY" ]; then
  echo "::error ::undefined variables"
  exit 1
fi

echo "::set-output name=aws_key::${AWS_ACCESS_KEY_ID}"
echo "::set-output name=aws_secret::${AWS_SECRET_ACCESS_KEY}"
echo "::set-output name=aws_region::${AWS_REGION}"
echo "::set-output name=aws_stage::${AWS_STAGE}"

exit 0