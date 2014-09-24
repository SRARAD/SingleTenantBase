package com.sra

import grails.test.mixin.TestFor
import spock.lang.*

/**
 * See the API for {@link grails.test.mixin.services.ServiceUnitTestMixin} for usage instructions
 */
@TestFor(HomeController)
class HomeControllerSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "test change password"() {
		when:
			controller.changePassword();
		
		then:
			view == '/home/chpass'
    }
}
