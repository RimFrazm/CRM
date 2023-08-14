using Microsoft.VisualStudio.TestTools.UnitTesting;
using OpenQA.Selenium;
using OpenQA.Selenium.Chrome;
using Xunit;

public class UnitTest1
{
    private const string Url = "https://localhost:44351/";
    private static IWebDriver _driverChrome;


    public static void Init(TestContext context)
    {
        _driverChrome = new ChromeDriver();
    }

    public void TestMethod1()
    {
        _driverChrome.Navigate().GoToUrl(Url);

        _driverChrome.FindElement(By.Id("lst-ib")).SendKeys("developpez.com");

        _driverChrome.FindElement(By.Id("lst-ib")).SendKeys(Keys.Enter);
    }
}