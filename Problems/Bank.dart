void main(){
  var obj1 = Bank();
  obj1.deposit(1000);
  obj1.checkBal;
  print(" Withdrawal Amount : ${obj1.withdraw(200)}");
  obj1.checkBal();

}

class Bank{
  int bal = 0;
  Bank();

  void deposit(int amount){
    bal+=amount;
  }

  int withdraw(int amount)
  {
    if( amount > bal )
    {
      print( "Can't process , Max amount to be withdraw : \$ ${bal}" );
      return amount;
    }
    bal-= amount;
    return amount;
  }

  void checkBal()
  {
    print(" Balance : \$${bal}");
  }
}