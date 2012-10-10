class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/"(controller: "featured", action: "index")
		"/browse"(controller: "browse", action: "index")
		"/deal/$id"(controller: "deal", action: "index")
		"/deal/purchase/$id"(controller: "deal", action: "purchase")
		"/profile"(controller: "profile", action: "index")
		"/admin"(controller: "admin", action: "index")
		"/company"(controller: "company", action: "index")
		"/controllers"(view:"/index")
		"500"(view:'/error')
	}
}
