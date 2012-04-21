class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/"(controller: "featured", action: "index")
		"/controllers"(view:"/index")
		"500"(view:'/error')
	}
}
