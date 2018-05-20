pragma solidity ^0.4.22;
//Смарт контракт предназначенный для ставки в эфире
contract LeagueOfBest {
    address owner;                                                                                   // тот кто контракт деплоит
    uint256 cou;
    uint256 val;
    
    constructor(){
        owner = msg.sender;                                                                          // при деплое выполняется
    }
    
    struct Data{
        address addr;
        int match_id;
        int result;
        uint256 col_eth;
    }
    
    mapping(uint => Data) public items;
    function bet(int _mid, int _result) payable {                                                    // функция чтобы присвоить значения в mape
        items[cou] = Data(msg.sender,_mid,_result,msg.value);
        cou += 1;
    }
    
    function get_info() constant public returns(address){                                            // возвращается адрес того, кто контракт деплоит(Букмекер)
        require(msg.sender == owner);
        return owner;
    }
    function get_eth() view returns(address){                                                        // возвращает адрес контракта
        return this;
    }
    function cont_balance() public view returns(uint256) {                                           // возвращает баланс контракта
        return address(this).balance;
    }
    
    function setFromContract(uint256 coef, int _match_id, int _result) public view returns(bool){      // отправляет эфир получателю с учетом коэффициента
        require(msg.sender == owner);
        for(var i = 0;i <= cou;i++){
            if (items[i].match_id == _match_id){
                if(items[i].result == _result){
                    items[i].addr.transfer((items[i].col_eth*coef)/100);
                }
            }
        }
}
}