# README
## SkillMatch
SkillMatchは転職を希望するエンジニアと、高度なスキルを持つ人材を見つけたい企業をマッチングさせるビジネスSNSです。  
転職用のポートフォリオとして作成しました。

## 概要

インフラ、CI/CDパイプラインの構築は完了済みです。  
肝心のアプリは絶賛開発中です。。

## 本番環境
下記URLからアクセスできます。

https://error4577.com/


## システム構成
![architecture](https://imgur.com/0bD7gCK.png)

## 使用技術
- Ruby 2.6.3
- Ruby on Rails 5.2.4.1
- MySQL
- Bootstrap
- GitHub
- Docker
- CircleCI
- Terraform
- AWS  
  (EC2 / VPC / ECR / ECS / RDS / ALB / S3 / ACM / Route53)

### CircleCI
GitHubのmasterブランチ以外のブランチにプッシュした際に自動ビルド、自動テストを実行するようにしています。  
また、masterブランチへマージした際には自動ビルド、自動テストに加えて、自動デプロイ、タスク定義の更新、migrationを実行するようにしています。

### AWS
CircleCIでビルドされたコンテナイメージをECRにpushし、それをECSにデプロイしています。  
ECSクラスターをEC2インスタンスにセットしています。  
データベースサーバとしてRDSを使用しています。  
画像はS3にアップロードしています。  
ALBで負荷分散を行っております。  
Route53でドメインを取得しています。  
ACMでSSL証明書を発行し、HTTPSでアクセス出来るようにしています。  

### Terraform
AWSのリソースをTerraformで管理し、インフラのコード化を実施しています。
.tfstateファイルはS3のバケットに保管しております。

## ERD
![erd](https://imgur.com/RWvGCP2.png)
