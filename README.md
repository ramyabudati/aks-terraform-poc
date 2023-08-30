# Azure AKS cluster creation by terrafrom

## azure connect method
  * To connect azure AKS, used service principal.
  * The below values are updated at "github repository secrets " section
    * AZURE_CLIENT_ID
    * AZURE_CLIENT_SECRET
    * AZURE_TENANT_ID
    * ARM_ACCESS_KEY    --> it is __storage account access key__ to push __terraform.tfstate__ file to __azure storage account , container__
   
## Azure resources created
  * resource group
  * VNET
  * applicaton gateway
  * public ip
  * AKS cluster
  * ACR container registery

## project summary

* to demonstrate creating & vesioning __infrastructure creation__ by terraform, by CI?CD of __github actions__

### Notes
* At the time of creating __AKS cluster__ intergrated __ACR__ registery.
* Used AKS networking method as __Azure CNI__
* __Application gateway ingress__ created and attached to __AKS__ cluster
* Applicaiton is access by __applciation gateway__ public IP.
