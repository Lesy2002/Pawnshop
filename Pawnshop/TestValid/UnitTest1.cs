using AuthorizationPawnshop;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;

namespace TestValid
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void TestMethod1()
        {
            bool expect = true;
            bool result = MainWindow.TestValidation("****", "****");
            Assert.AreEqual(expect, result);
        }
    }
}
