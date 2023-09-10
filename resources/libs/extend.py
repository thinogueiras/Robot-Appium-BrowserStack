from robot.api.deco import keyword
from robot.libraries.BuiltIn import BuiltIn

from selenium.webdriver.common.by import By

from appium.webdriver.common.touch_action import TouchAction


@keyword('My Drag And Drop')
def drag_and_drog(origin, target):
    appium_lib = BuiltIn().get_library_instance('AppiumLibrary')

    driver = appium_lib._current_application()

    element_origin = driver.find_element(By.XPATH, origin)
    element_target = driver.find_element(By.XPATH, target)

    actions = TouchAction(driver)
    actions.long_press(element_origin).move_to(element_target)
    actions.release()
    actions.perform()
