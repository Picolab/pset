ruleset pset {
  meta {
    use module io.picolabs.subscription alias subs
    shares __testing, pset
  }
  global {
    __testing = { "queries":
      [ { "name": "__testing" }
      , { "name": "pset", "args": [ "key" ] }
      ] , "events":
      [ ]
    }
    pset = function(key){
      echo_eci = subs:established("Tx_role","echo").head(){"Tx"};
      url = meta:host + "/sky/event/" + echo_eci + "/none/echo/echo";
      http:get(url,qs={"key":key},
        autosend={"eci":meta:eci,"domain":"http","type":"get"})
    }
  }
  rule pset {
    select when http get
    pre {
      content = event:attrs{"content"}
    }
    if event:attr("status_code") == 200 then noop()
    fired {
      ent:key := content.decode(){"key"}
    }
  }
}
