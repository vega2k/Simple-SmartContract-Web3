pragma solidity ^0.4.25;
contract DataType {
    uint public myInt256 = 10;
    uint8 public myInt8 = 20; //8bit = 0 ~ 255 
    
    bool public isFlag = false;
    
    bytes5 public myStr = "abcef";  //static arr
    
    bytes public myStr2 = "abc";    //dynamic arr
    
    string public myStr3 = "abc";   //dynamic arr(UTF-8)
    
    enum OS { windows, Linux, OSX, UNIX }
    OS public myOS = OS.Linux;
}