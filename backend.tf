terraform { 
  cloud { 
    
    organization = "tutor-zone"

    workspaces { 
      name = "tutor-zone-wk"
    } 
  } 
}