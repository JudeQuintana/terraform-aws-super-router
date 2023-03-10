/*
* # Super Router Description
* This is a follow up to the [generating routes post](https://jq1.io/posts/generating_routes/).
*
* Original Blog Post: [Super Powered, Super Sharp, Super Router!](https://jq1.io/posts/super_router/)
*
* Fresh new decentralized design in [$init super refactor](https://jq1.io/posts/init_super_refactor/).
*
* New features means new steez in [Slappin chrome on the WIP'](https://jq1.io/posts/slappin_chrome_on_the_wip/)!
*
* Super Router provides both intra-region and cross-region peering and routing for Centralized Routers and Tiered VPCs (same AWS account only, no cross account).
*
* Super Router is composed of two TGWs instead of one TGW (one for each region).
*
* Example:
* ```
* module "super_router_usw2_to_use1" {
*   source  = "JudeQuintana/super-router/aws"
*   version = "1.0.0"
*
*   providers = {
*     aws.local = aws.usw2 # local super router tgw will be built in the aws.local provider region
*     aws.peer  = aws.use1 # peer super router tgw will be built in the aws.peer provider region
*   }
*
*   env_prefix       = var.env_prefix
*   region_az_labels = var.region_az_labels
*   super_router = {
*     name = "professor-x"
*     local = {
*       amazon_side_asn     = 64521
*       centralized_routers = module.centralized_routers_usw2
*     }
*     peer = {
*       amazon_side_asn     = 64522
*       centralized_routers = module.centralized_routers_use1
*     }
*   }
* }
* ```
*
* The resulting architecture is a decentralized hub spoke topology:
* ![super-router](https://jq1.io/img/Super_Router_Shokunin.png)
*/
