#include<stdio.h>
int main()
{
	int x,i,z,j,limit,total=0,counter=0, atime[10], btime[10], tquantum,wat=0,tat=0,pos,p[10],pri[10],temp[10],b;
	printf("enter number of process: ");
	scanf("%d",&x);
	printf("\n");
	
	for(int i = 0; i < x; i++) 
    {
       printf("\nEnter total Details of Process[%d]\n", i + 1);
            printf("Arrival Time:\t");
            scanf("%d", &atime[i]);
            printf("Burst Time:\t");
            scanf("%d", &btime[i]); 
    }
    
    printf("enter the time Quantum: ");
    scanf("%d",tquantum);
    
    
    printf("\nProcess ID\t\tBurst Time\t Turnaround Time\t Waiting Time\t priority\n");
      for(total = 0, i = 0; x != 0;) 
      { 

		    for(z=0;z<x;z++)
		    {
				int temp1;
				pos=z;
				for(j=z+1;j<x;j++)
				{
			    	if(pri[j]<pri[pos])
					pos=j;
				}
		 
				temp1=pri[z];
	
				pri[z]=pri[pos];
	
				pri[pos]=temp1;
		 
				temp1=btime[z];
				btime[z]=btime[pos];
				btime[pos]=temp1;
			 	temp1=atime[z];
				atime[z]=atime[pos];
				atime[pos]=temp1;
	
				temp1=p[z];
				p[z]=p[pos];
				p[pos]=temp1;

				temp1=temp[z];
				temp[z]=temp[pos];
				temp[pos]=temp1;
		    }
		            
			if(temp[i] <= tquantum && temp[i] > 0) 
            { 
                  total = total + temp[i]; 
                  temp[i] = 0; 
                  counter = 1; 
            } 
            
			else if(temp[i] > 0) 
            { 
                  temp[i] = temp[i] - tquantum; 
                  total = total + tquantum; 
            } 

	for(b=0;b<x;b++)
		{
			if(b==i)
			pri[b]+=1;
			else
			pri[b]+=2;
		}

            if(temp[i] == 0 && counter == 1) 
            { 
                  x--; 
                  printf("\nProcess[%d]\t\t%d\t\t %d\t\t %d\t\t%d", p[i], btime[i], total - atime[i], total - atime[i] - btime[i],pri[i]);
                  wat = wat + total - atime[i] - btime[i]; 
                  tat = tat + total - atime[i]; 
                  counter = 0; 
            } 
            if(i == x - 1) 
            {
                  i = 0; 
            
			}
            else if(atime[i + 1] <= total) 
            {
                  i++;
            
			}
            else 
            {
                  i = 0;
            
			}		
      } 
      return 0; 
      
      
}
