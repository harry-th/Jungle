

describe('Product', () => {
    it('clicking on last product should lead to first(id) product page', () => {
        cy.visit("/")
        cy.get(".products article").last()
            .click()
        cy.url().should('include', '/products/1')
        cy.get('article.product-detail h1').contains('Giant Tea')
            .should('exist')
    })
})