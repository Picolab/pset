ruleset echo {
  meta {
    shares __testing
  }
  global {
    __testing = { "queries": [ { "name": "__testing" } ]
      , "events": [ { "domain": "echo", "type": "echo" } ]
    }
  }
  rule give_back {
    select when echo echo
    send_directive("_txt",{"content":encode(event:attrs)})
  }
}
