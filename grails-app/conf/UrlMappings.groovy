class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/"(view:"/featured/index")
		"/controllers"(view:"/index")
		"500"(view:'/error')
	}
}
