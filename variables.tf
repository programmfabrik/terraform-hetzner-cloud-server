# Set the variable value in *.tfvars file
# or using the -var="hcloud_token=..." CLI option
variable "hcloud_token" {
    description = "Hetzner Cloud API token"
    type = string
}

variable "ssh_private_key" {
    description = "Path to the location where the private key is stored to connect to the machines"
    default     = "~/.ssh/id_rsa"
    type = string
}

variable "ssh_public_key" {
    description = "Public Key to authorized the access to the machines"
    default     = "~/.ssh/id_rsa.pub"
    type = string
}

variable "ssh_username" {
    description = "Username that should be used to connect to the nodes"
    default = "root"
    type = string
}

resource "hcloud_ssh_key" "admin_ssh_key" {
    name       = "admin_ssh_key"
    public_key = file(var.ssh_public_key)
}

variable "hetzner_machine_type" {
    description = "Defines the hetzner machine"
    default = "cx11"
    type = string
}

variable "hetzner_machine_os" {
    description = "Defines the hetzner machine operation system"
    default = "debian-10"
    type = string
}

variable "github_actions_provision_url" {
    description = "Defines the github actions target url. Can be a specific repository or company"
    default = ""
    type = string
}

variable "github_actions_provision_token" {
    description = "Defines the github actions self hosted runner registration token"
    default = ""
    type = string
}

variable "github_actions_runner_count" {
    description = "Defines the amount of runners that should be provisioned"
    default = 1
    type = number
}

variable "github_actions_runner_labels" {
    description = "Defines a list of labels used to identify the runner. The list is a simple string seperated by ','"
    default = ""
    type = string
}

variable "github_actions_runner_replace_existing" {
    description = "Defines if existing runners should be destroyed"
    default = false
    type = bool
}