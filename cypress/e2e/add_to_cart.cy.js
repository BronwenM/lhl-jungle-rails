describe("Add to Cart", () => {
  it("should add 1 in stock item to cart", () => {
    cy.visit("/");

    cy.get(".products article [alt='Scented Blade']")
      .click();

    cy.contains("Scented Blade").should("exist")
    
    cy.get("a").contains("My Cart").contains('0');

    cy.contains("button", "Add")
      .click();
    
    cy.get("a").contains("My Cart").contains('1');
    cy.get("a").contains("My Cart").contains('0').should("not.be.true");
  });

  it("should NOT add 1 out-of-stock item to cart", () => {
    cy.visit("/");

    cy.get(".products article [alt='Giant Tea']")
      .click();

    cy.contains("Giant Tea").should("exist")

    cy.contains("button", "Add")
      .click();
    
    cy.get("a").contains("My Cart").contains('0');
  });
  
})