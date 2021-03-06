[
  {
    "name": "skillmatch",
    "image": "759807949322.dkr.ecr.ap-northeast-1.amazonaws.com/skillmatch-image:latest",
    "cpu": 200,
    "memory": null,
    "memoryReservation": 600,
    "essential": true,
    "command": ["bundle", "exec", "rails", "db:create", "db:migrate"],
    "environment": [
      {
        "name": "RAILS_ENV",
        "value": "production"
      },
      {
        "name": "RACK_ENV",
        "value": "production"
      }
    ],
    "logConfiguration": {
      "logDriver": "awslogs",
      "options": {
        "awslogs-group": "skillmatch-service",
        "awslogs-region": "ap-northeast-1",
        "awslogs-stream-prefix": "migration"
      }
    }
  }
]