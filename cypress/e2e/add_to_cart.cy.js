describe("Add to Card", () => {
  beforeEach(() => {
    cy.visit("/");
    cy.get(".products article [alt='Scented Blade']")
      .click();

    cy.contains("Scented Blade").should("exist")
  });

  it("should add 1 item to cart", () => {
    cy.get("a").contains("My Cart").contains(0);

    cy.contains("button", "Add")
      .click();
    
    cy.get("a").contains("My Cart").contains(1);
    cy.get("a").contains("My Cart").contains(0).should("not.be.true");
  });
  
})