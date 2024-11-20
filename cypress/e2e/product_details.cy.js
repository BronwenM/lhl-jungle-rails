describe("Product page", () => {
  it("should visit the root", () => {
    cy.visit("/");
  });

  it("There are products on the page", () => {
    cy.visit("/");
    cy.get(".products article").should("be.visible");
  });

  it("Visits individual product page", () => {
    cy.visit("/");
    cy.get(".products article [alt='Scented Blade']")
      .click();
  });
})