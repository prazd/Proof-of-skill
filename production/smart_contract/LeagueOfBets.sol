pragma solidity ^0.4.22;
//Смарт контракт предназначенный для ставки в эфире
contract LeagueOfBest {
    
    address owner;                                                                 // тот кто контракт деплоит
    uint256 cou;
    uint256 val;
    constructor(){
        owner = msg.sender;                                                        // при деплое выполняется
    }
    
    struct Data{
        address addr;
        int match_id;
        bool team;
        uint256 col_eth;
    }
    
    mapping(uint => Data) public items;
    function bet(int _mid, bool _team) payable {                                   // функция чтобы присвоить значения в mape
        items[cou] = Data(msg.sender,_mid,_team,msg.value);
        cou += 1;
    }
    
    function get_info() constant returns(address){                                 // возвращается адрес того, кто контракт деплоит(Букмекер)
        require(msg.sender == owner);
        return owner;
    }
    
    function get_eth() view returns(address){                                      // возвращает адрес контракта
        return this;
    }
    
    
    function cont_balance() public view returns(uint256) {                         // возвращает баланс контракта
        return address(this).balance;
    }
    
    function setFromContract(address reciever, uint256 ef) public returns(bool) {  // отправляет эфир получателю
        require(msg.sender == owner); 
        reciever.transfer(ef);  
    }
    //test
    struct Match_result{
       
    }
    //function test(int _match){
        
    //}
}