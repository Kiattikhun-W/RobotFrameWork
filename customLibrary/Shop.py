from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn


@library
class Shop:
    def __init__(self):
        self.selLib = BuiltIn().get_library_instance("SeleniumLibrary")

    @keyword
    def hello_world(self):
        print('helloWorldZa')

    @keyword
    def add_items_to_cart_and_checkout(self, products):
        # Get WebElements
        i = 1
        products_titles = self.selLib.get_webelements(" css:.card-title")
        for productsTitle in products_titles:
            if productsTitle.text in products:
                self.selLib.click_button("xpath:(//*[@class='card-footer'])[" + str(i) + "]/button")

            i = i + 1
