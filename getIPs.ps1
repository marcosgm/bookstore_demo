#credit https://stackoverflow.com/questions/75856201/how-to-retrieve-the-public-ip-address-of-an-aws-ecs-contrainer-using-terraform

$clustername=$(aws ecs list-clusters --query "clusterArns[0]" --output text)
$taskid=$(aws ecs list-tasks --cluster $clustername --query "taskArns[0]" --output text)
$eni=$(aws ecs describe-tasks --tasks $taskid --cluster $clustername --query "tasks[0].attachments[0].details[?name=='networkInterfaceId'].value" --output text)
$publicip=$(aws ec2 describe-network-interfaces --query "NetworkInterfaces[?NetworkInterfaceId=='$eni'].Association.PublicIp" --output text)
Write-Host "AWS instance on http://$($publicip):8080"

$azip=$(az container list --query "[0].ipAddress.ip").Trim('"')
Write-Host "Azure instance on http://$($azip):8080"
