public void setup() {            
  int [] theArray = {1, 3, 5, 7, 10};           
  System.out.print(binarySearch(theArray, 0)+", ");            
  System.out.print(binarySearch(theArray, 1)+", ");            
  System.out.print(binarySearch(theArray, 3)+", ");            
  System.out.print(binarySearch(theArray, 6)+", ");            
  System.out.print(binarySearch(theArray, 10)+", ");            
  System.out.println(binarySearch(theArray, 11));          
  System.out.print(binarySearch(theArray, 0, 0, 4)+", ");            
  System.out.print(binarySearch(theArray, 1, 0, 4)+", ");            
  System.out.print(binarySearch(theArray, 3, 0, 4)+", ");            
  System.out.print(binarySearch(theArray, 6, 0, 4)+", ");            
  System.out.print(binarySearch(theArray, 10, 0, 4)+", ");            
  System.out.println(binarySearch(theArray, 11, 0, 4));
}      
public static int binarySearch(int [] naNums, int nTarget) {           
  /* Your code here */
  int high=naNums.length-1;
  int low=0;
  while (high>=low){
    int guess= (low+high)/2;
    if (naNums[guess]==nTarget)
    return guess;
    else if(naNums[guess]<nTarget)
    low=guess+1;
    else 
    high=guess-1;
   // guess=guess/2;
  }
  return -1;
 
}      
public static int binarySearch(int [] naNums, int nTarget, int low, int high) {
    int guess=(low+high)/2;
  if(naNums[guess]==nTarget)
  return guess;
  else if (naNums[guess]<nTarget){
      if (guess>=high)
      return -1;
  return binarySearch(naNums,nTarget,guess+1,high);

  }
  else if(naNums[guess]>nTarget){
    if (guess<=low)
    return -1;
  return binarySearch(naNums,nTarget,low, guess-1);

  }
  return -1;

  /* Your recursive code here */
  //if 
  
}  