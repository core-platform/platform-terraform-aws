# Terraform Quick Reference notes

## Introduction:
* Purpose of Terraform is declaring 'Resources'. A group of resources can be gathered into
  'Module', which creates a large unit of configurations
* Terraform configuration consists of a root module, where evaluation begins, along with a
  tree of child modules created when one module calls other

    ### Arguments, Blocks, and Expressions
    
    ```resource "aws_vpc" "main" {
        cidr_block = var.base_cidr_block
    }
    ```
    * Syntax:
    
    ```<BLOCK TYPE> "<BLOCK LABEL>" "<BLOCK LABEL>" {
        # Block body
        <IDENTIFIER> = <EXPRESSION> # Argument
    }
    ```
    * Blocks are containers for other content and usually represents the configuration of some kind of objects, like a resource. Block has a <block type> and can have zero or more labels and have a body that contains any number of arguments and nested blocks
    * Arguments assign a value to a name. They appear within blocks.
    * Expressions represent a value, either literally or by referencing and combining other values. They appear as values for arguments, or within other expressions. 

    ### Code organisation and Config Ordering
    * Configuration files that are named with the .tf file extension and must always use UTF-8 encoding, and by convention are usually maintained with Unix-style line endings (LF) rather than Windows-style line endings (CRLF), though both are accepted.
    * A module is a collection of .tf files kept together in a directory. The root module is built from the configuration files in the current working directory when Terraform is run, and this module may reference child modules in other directories, which can in turn reference other modules, etc.
    * Configuration language is declarative, the ordering of blocks is generally not significant. (The order of provisioner blocks within a resource is the only major feature where block order matters.)
    * Terraform automatically processes resources in the correct order based on relationships defined between them in configuration, and so you can organize resources into source files in whatever way makes sense for your infrastructure.
    * Terraform has no knowledge about specific types of infrastructure objects. Instead, Terraform uses plugins called providers that each defines and manages a set of resource types.
    * Basic example of network topology: https://www.terraform.io/docs/configuration/index.html#example

## Resources
* Each resource block describes one or more infrastructure objects. A resource block has no significance outside of the scope of a module
* Resource type and local name together server as identifier for a given resource and so must be unique within a module
```resource "aws_instance" "web" {
  ami           = "ami-a1b2c3d4"
  instance_type = "t2.micro"
}
```
* Within a block are the configuration arguments for the resource itself and is dependent on the resource type
* Each resource is associated with a single resource type, which determines the kind of infrastructure object it manages and what arguments and other attributes it supports.
* Each resource type, in turn, belongs to a 'provider' (A plugin for Terraform), that offers a collection of resource types based on cloud provide
* There are some meta-arguments which are common across all resource types