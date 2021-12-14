variable "tags" {
    default     = {
      Project = "project1"
    }
    description = "Global tags"
    type        = map(string)
}