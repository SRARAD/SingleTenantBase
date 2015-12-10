class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}
		"/"(controller:"home")
		"/health"(controller:"home",action:"health")
		"500"(view:'/error')
		"404"(view:'/404')
	}
}
