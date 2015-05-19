contract propertyToken {
	address minter;
	mapping (address => uint) tokens;
	
	function propertyToken() {
		tokens[msg.sender] = 10;
		minter = msg.sender;
	}
	
	function mint(address owner, uint amount) {
		if (msg.sender != minter)
			return;
		
		tokens[owner] += amount;
	}
	
	function sendPToken(address receiver, uint amount) returns(bool sufficient) {
		if (tokens[msg.sender] < amount)
			return false;

		tokens[msg.sender] -= amount;
		tokens[receiver] += amount;
		
		return true;
	}
	
	function queryTokens(address addr) constant returns (uint token) {
		return tokens[addr];
	}
}