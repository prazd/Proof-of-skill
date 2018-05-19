pragma solidity ^0.4.22;

//Смарт контракт предназначенный для ставки в эфире
contract LeagueOfBest {

    mapping(address => uint256) public sendETH;//map со значениями key(адрес отправителя): value(количество эфира)
    address owner;                             //тот кто контракт деплоит
    
    constructor(){
        owner = msg.sender; //при деплое выполняется
    }
    
    function get_info() constant returns(address){  //возвращается адрес того, кто контракт деплоит(Букмекер)
        require(msg.sender == owner);
        return owner;
    }
    
    function get_eth() view returns(address){  //возвращает адрес контракта
        return this;
    }
    
    function () public payable { // отправляет эфир в смарт-контракт с залогиненного акка 
        sendETH[msg.sender] = msg.value;
    }
    
    function cont_balance() public view returns(uint256) { // возвращает баланс контракта
        return address(this).balance;
    }
    
    function setFromContract(address reciever, uint256 ef) public returns(bool) {  //отправляет эфир получателю
        require(msg.sender == owner); 
        reciever.transfer(ef);  
    }
    
}