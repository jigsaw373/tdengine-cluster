variable region {
    type = string
    default = "ca-central-1"
}

variable profile { 
    type = string 
    default = "demo"
}

variable workers {
    type = list(object({
        type = string
        size = number
    }))
    default = null
}

variable ami { 
    type = string 
    default = "replace with image"
}