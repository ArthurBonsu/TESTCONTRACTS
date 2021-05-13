pragma solidity >=0.7.0 <0.9.0;

/** 
 * @title Ballot
 * @dev Implements voting process along with vote delegation
 */
contract UserClassificationContracts {
   
     struct EnergyUser {
         string name; // name of the user
        uint usernumbercount ; // index of user number count
         address  userid; // user id of user
        bool status ;  // currently a non-renewable user
        address useraddress; // person address
           
    }
   
    struct NonRenewableEnergyUser {
         string  name; // name of the user
        uint usernumbercount ; // index of user number count
         address  userid; // user id of user
        bool status ;  // currently a non-renewable user
        address useraddress; // person address
           
    }

    struct RenewableEnergyUser {
         string  name; // name of the user
        uint usernumbercount ; // index of user number count
         address  userid; // user id of user
        bool status ;  // currently a non-renewable user
        address useraddress; // person address
           
    }
    address public newuseraddress;
    string  public newusername;
    bool devicetypes; 
      
    mapping(address => EnergyUser) public energyusers;
    mapping(address => NonRenewableEnergyUser) public renewalenergyusers;
    mapping(address => RenewableEnergyUser) public nonrenewalenergyusers;

    EnergyUser[] public enusers;
    RenewableEnergyUser[] public rnusers;
    NonRenewableEnergyUser[] public nrusers;
    /** 
     * @dev Create a new user, get their information  and list them in newusername'.
     * @param _newusername and _devicetype
     */
    constructor(string[]  memory _newusername, bool _devicetype)   {
          for (uint i = 0; i < _newusername.length; i++) {
        newuseraddress = msg.sender;
        newusername =_newusername[i];
        _devicetype = true;
        devicetypes = _devicetype; 
        
       
            // 'Proposal({...})' creates a temporary
            // Proposal object and 'proposals.push(...)'
            // appends it to the end of 'proposals'.
            enusers.push(EnergyUser({
                
               name:_newusername[i], // name of the user
               usernumbercount: i, // index of user number count
               userid: msg.sender,
               status: true,  // currently a non-renewable user
               useraddress: newuseraddress // person address
           
                
            }));
        }
    
        
        
    }
    event setclassifierevent(address useraddress, bool _devicetypes);
    function setclassifier(bool _devicetype) public {
     
                   if(devicetypes == true){
        for (uint i = 0; i < rnusers.length; i++) {
             
            nonrenewalenergyusers[newuseraddress].usernumbercount = i;
            // 'Proposal({...})' creates a temporary
            // Proposal object and 'proposals.push(...)'
            // appends it to the end of 'proposals'.
           
           rnusers.push(RenewableEnergyUser({
                
               name:newusername, // name of the user
               usernumbercount: i, // index of user number count
               userid: msg.sender,
               status: true,  // currently a non-renewable user
               useraddress: msg.sender // person address
           
                
            }));
           
     emit setclassifierevent(msg.sender, _devicetype);       
        }
                       
                       
                   }   
                   
                  else 
        
                   {
            for (uint i = 0; i < nrusers.length; i++) {
             
            renewalenergyusers[newuseraddress].usernumbercount = i;
            // 'Proposal({...})' creates a temporary
            // Proposal object and 'proposals.push(...)'
            // appends it to the end of 'proposals'.
           
           nrusers.push(NonRenewableEnergyUser({
                
               name:newusername, // name of the user
               usernumbercount: i, // index of user number count
               userid: msg.sender,
               status: true,  // currently a non-renewable user
               useraddress: msg.sender // person address
           
                
            }));
           
             emit setclassifierevent(msg.sender, _devicetype);
            
        }
    }
}
    
    /** 
     * @dev Give 'voter' the right to vote on this ballot. May only be called by 'chairperson'.
     * @param voter address of voter
     */
    
    
   
    
}
