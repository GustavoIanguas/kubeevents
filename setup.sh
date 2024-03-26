cat /var/password.file | while read line; do
    export PASS=$line
done

az login --service-principal -t $TENANT -u $SP_USER -p $PASS
az account set --subscription $SUBSCRIPTION
az aks get-credentials --resource-group $RESOURCE_GROUP --name $AkS_NAME --overwrite-existing --admin