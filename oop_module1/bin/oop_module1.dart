//This is a Membership Loyalty Program for a grocery chain

class Customer {
  String _membershipType = '';
  String _firstName = '';
  String _lastName = '';

  checkMembership() {
    //This method checks membership type
    if (_membershipType == 'Gold') {
      return 'Gold';
    } else {
      return 'Regular';
    }
  }

  void login() {
    //This method describes the  membership type and prints Customer Name
    //Abstraction
    if (checkMembership() == 'Gold') {
      print(_firstName + ' ' + _lastName + ' is a Gold Member');
    } else {
      print(_firstName + ' ' + _lastName + ' is a Regular Customer');
    }
  }

  Customer(this._membershipType, this._firstName, this._lastName); //Constructor
}

class Gold extends Customer {
  //Inheritance declaration
  //This child class asks additional necessary information for a Gold Member
  @override
  checkMembership() {
    return 'Gold';
  }

  int pointsEarned;
  String address;
  int memberSince;
  int yearValid;
  @override
  void login() {
    super.login(); //Polymorphism
    print('Points Earned: ' +
        pointsEarned.toString() +
        '\n' +
        'Address: ' +
        address +
        '\n' +
        'Member Since: ' +
        memberSince.toString() +
        '\n' +
        'Valid Until: ' +
        yearValid.toString() +
        '\n');
  }

  Gold(
      String membershipType,
      String firstName,
      String lastName,
      //Gold Member has 3 additional Entries
      this.pointsEarned,
      this.address,
      this.memberSince,
      this.yearValid)
      : super(membershipType, firstName, lastName);
}

class Regular extends Customer {
  //Inheritance Declaration
  @override
  checkMembership() {
    return 'Regular';
  }

  String address;
  int memberSince;
  @override
  void login() {
    super.login(); //Polymorphism
    print('Address: ' +
        address +
        '\n' +
        'Member Since: ' +
        memberSince.toString() +
        ' No Expiry' +
        '\n\n' +
        'Upgrade to Gold Membership and Enjoy Exclusive Perks!');
  }

  Regular(
    String membershipType,
    String firstName,
    String lastName,
    this.address,
    this.memberSince,
  ) : super(membershipType, firstName, lastName);
}

void main() {
  //Declaring Objects
  Gold shopper1 =
      Gold('Gold', 'John', 'Appleseed', 3, 'General Santos City', 2012, 2022);
  shopper1.login(); //Abstraction

  Regular shopper2 =
      Regular('Regular', 'Angelina', 'Jolie', 'General Santos City', 2002);
  shopper2.login(); //Abstraction
}
