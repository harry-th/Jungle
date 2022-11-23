

describe('Product', () => {
    it('clicking on last product should lead to first(id) product page', () => {
        cy.visit("/")
        cy.get(".products article .button_to  button").last()
            .click()
        cy.get('.navbar-nav li.end-0').contains('My Cart (1)')
            .should('exist')
    })
})