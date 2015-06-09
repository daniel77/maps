package alo



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class RealtyController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Realty.list(params), model:[realtyInstanceCount: Realty.count()]
    }

    def show(Realty realtyInstance) {
        respond realtyInstance
    }

    def create() {
        respond new Realty(params)
    }

    @Transactional
    def save(Realty realtyInstance) {
        if (realtyInstance == null) {
            notFound()
            return
        }

        if (realtyInstance.hasErrors()) {
            respond realtyInstance.errors, view:'create'
            return
        }

        realtyInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'realty.label', default: 'Realty'), realtyInstance.id])
                redirect realtyInstance
            }
            '*' { respond realtyInstance, [status: CREATED] }
        }
    }

    def edit(Realty realtyInstance) {
        respond realtyInstance
    }

    @Transactional
    def update(Realty realtyInstance) {
        if (realtyInstance == null) {
            notFound()
            return
        }

        if (realtyInstance.hasErrors()) {
            respond realtyInstance.errors, view:'edit'
            return
        }

        realtyInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Realty.label', default: 'Realty'), realtyInstance.id])
                redirect realtyInstance
            }
            '*'{ respond realtyInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Realty realtyInstance) {

        if (realtyInstance == null) {
            notFound()
            return
        }

        realtyInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Realty.label', default: 'Realty'), realtyInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'realty.label', default: 'Realty'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
