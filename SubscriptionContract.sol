pragma solidity >=0.7.0 <0.9.0;

/** 
 * @title UserClassificationContracts
 * @dev Implements a energy class process for energy generation
 */
contract SubscriptionContract {
   
     struct NewUser {
         string name; // name of the user
        uint usernumbercount ; // index of user number count
         address  userid; // user id of user
        bool registered ;  // currently a non-renewable user
        bool approved;
        address useraddress; // person address
           
    }
   
    struct DistributedEnergyResource {
         address deviceid ; // id of devices
         string  devicename; // name of the device
        uint amountofenergyconsumed; // amount of energy consumed by device per year
         uint devicecapacity;   // amount of energy held by device
        bool renewableornot ;  // currently a renewable device or not
        bool registered; // registered or not
        uint devicecount;
    }

    
    address public newuseraddress;
    string  public newusername;
    address public newowner;      
    
    mapping(address => NewUser) public newuserstosubscribe;
    mapping(address => DistributedEnergyResource) public distributedEnergyResources;
  
 
    NewUser[] public thenewusers;
    DistributedEnergyResource[] public thedistributedenergydevices;
  
    string[]  public newusernameslist;
    address[] public newuseraddresslist;
    
     string[] public registereduserlist;
    
    string[] public newregisterddevicelist;
    address[] public newregistereddeviceaddresslist;
    /** 
     * @dev Create a new user, get their information  and list them in newusername'.
     * @param _newusername and _devicetype
     */
    constructor(address _newuseradress, string memory _newusername)   {
           newowner = msg.sender;
      
          
          for (uint i = 0; i < newuseraddresslist.length; i++) {
         newusernameslist.push(_newusername);
         newuseraddresslist.push(_newuseradress);
         
          newusername =_newusername;
           newuseraddress = _newuseradress;
      
        
       
            // 'Proposal({...})' creates a temporary
            // Proposal object and 'proposals.push(...)'
            // appends it to the end of 'proposals'.
            thenewusers.push(NewUser({
                
               name:_newusername, // name of the user
               usernumbercount: i, // index of user number count
               userid: newuseraddress,
               registered: false,  // currently a non-renewable user
               useraddress: newuseraddress, // person address
               approved: true
                
            }));
        }
    
        
        
    }
    
    
     event registernewuserevent(address newuserevent, string  nameevent, uint ageevent, bool renewableornotevent,string  descriptionevent);
    function registernewuser(address newuser, string memory  name, uint age, bool renewableornot,string memory description ) public returns (address _newuser, string memory _name, uint _age, bool _renewableornot,string memory _description){

            NewUser storage registeringuser = newuserstosubscribe[msg.sender];
        require(registeringuser.registered == false, "You already registered");
        //        require(to != msg.sender, "Self-delegation is disallowed.");

        while (newuserstosubscribe[newuser].useraddress != address(0)) {
            newuserstosubscribe[newuser].approved = true;

            // We found a loop in the delegation, not allowed.
    //        require(to != msg.sender, "Found loop in delegation.");
      
      
        }
          
          
          for (uint i = 0; i < registereduserlist.length; i++) {
          
           registereduserlist.push(name);
            newuserstosubscribe[newuser].usernumbercount = i;
            // 'Proposal({...})' creates a temporary
            // Proposal object and 'proposals.push(...)'
            // appends it to the end of 'proposals'.
           
           thenewusers.push(NewUser({
                
               name:name, // name of the user
               usernumbercount: i, // index of user number count
               userid: newuser,
               registered: false,  // currently a non-renewable user
               useraddress: newuser, // person address
               approved: true
           
                
            }));
           
       
        }
          
          
            emit registernewuserevent(newuser,  name,  age,renewableornot, description);  
        return(newuser, name,  age, renewableornot, description );
    }
    
     
     
     event registernewdeviceevent(address deviceidevent, string  devicenameevent, uint amountofenergyconsumedevent, uint devicecapacityevent,bool renewableornotevent, bool registeredevent);
    
    function registernewdevice(address deviceid, string memory devicename, uint amountofenergyconsumed, uint devicecapacity,bool renewableornot,bool registered ) public returns (address _deviceid, string memory  _devicename, uint _amountofenergyconsumed, uint _devicecapacity,bool _renewableornot,bool _registered){

                DistributedEnergyResource storage registeringnewdevice = distributedEnergyResources[deviceid];
        require(registeringnewdevice.registered == false, "You already registered");
      
                  for (uint i = 0; i < newregistereddeviceaddresslist.length; i++) {
          newregistereddeviceaddresslist.push(deviceid);
          newregisterddevicelist.push(devicename);
          
                thedistributedenergydevices.push(DistributedEnergyResource({
              
       
               deviceid:deviceid, // unique id  of the device
               devicename: devicename, // name of device given
               amountofenergyconsumed: amountofenergyconsumed, // amount of energy consumed by device
               devicecapacity: devicecapacity,  // capacity of device
               renewableornot: true, // is device a renewable energy source or not
               registered: true, // is the device registered or not 
               devicecount: i // name of device given
           
                
            }));
           
       
        }
          
          
            emit registernewdeviceevent(deviceid,   devicename,  amountofenergyconsumed,  devicecapacity, renewableornot, registered);  
        return(deviceid,   devicename,  amountofenergyconsumed,  devicecapacity, renewableornot, registered );
    }
    
    
  

    
    
    
   
    
}
