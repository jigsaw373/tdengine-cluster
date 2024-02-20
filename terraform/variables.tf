variable region {
    type = string
    default = "ca-central-1"
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