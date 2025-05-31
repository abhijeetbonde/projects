Helloo!!

To use this project without a backend file -->
    Update the subscription in main.tf
    Comment "backend" section in terraform block
    Az login from terminal
    Execute terraform commands.

To us this project with backend -->
    Create storage account in azure
    fill backend.tf file with relevant details
    Remove/comment "subscription" in azurerm block
    Az login in terminal
    Execute terraform commands
