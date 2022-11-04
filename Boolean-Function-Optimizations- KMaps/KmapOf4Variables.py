from typing import Tuple
#import K_map_gui_tk as km
def is_legal_region(kmap_function, term):
	k=len(term)

# we represent none with 2 for easier code
	for i in range(k):
		if(term[i]==None):
			term[i]=int(2)

#for k=4 any expression is of the form abcd where 0<=a,b,c,d<=2. for an expression ij you store in start[3*i+j] and end[3*i+j] the 
#start and end rows  (with 0 indexing) of the Kanaugh map for which that expression is satisfied. That is for all rows 
# start, (start+1)%4,...,(end-1)%4, end, the expression ij is satisfied. Since column labelling is same as row labelling, the karnaugh map 
#would be having top-left corner as (start[3*c+d],start[3*a+b]) and bottom right corner as (end[3*c+d],end[3*a+b]).
#for k=2 any expression is of the form ab where 0<=a,b<=2. for an expression i you store in start[i] and end[i] the start and end rows of the
#Kanaugh map for which i is satisfied. So top left corner is (start[b],start[a]) and bottom right corner (end[b],end[a]).
#for k=3 the top left corner is (start[3*b+c],start[a]) and bottom right corner is (end[3*b + c],end[a]) for an expression abc 0<=a,b,c<=2.
#For checking if Karnaugh map is valid, you first iterate over column index and then over the row index.


	start=[0,1,0,3,2,2,3,1,0]
	end=[0,1,1,3,2,3,0,2,3]
	
	ans=True

	if(k==4):
		z2=3*term[0]+term[1]
		z1=3*term[2]+term[3]

		s1=start[z1]
		e1=end[z1]
		s2=start[z2]
		e2=end[z2]

		while(True):
			while(True):
				if(kmap_function[s1][s2]==0):
					ans=False
				if(s2==e2):
					s2=start[z2]
					break
				s2=(s2+1)%4

			if(s1==e1):
				break
			s1=(s1+1)%4

	elif (k==2):

		z2=term[0]
		z1=term[1]

		s1=start[z1]
		e1=end[z1]
		s2=start[z2]
		e2=end[z2]

		while(True):
			while(True):
				if(kmap_function[s1][s2]==0):
					ans=False
				if(s2==e2):
					s2=start[z2]
					break
				s2=(s2+1)%2
			if(s1==e1):
				break
			s1=(s1+1)%2


	else: #when k = 3

		z1=term[2]
		z2=3*term[0]+term[1]

		s1=start[z1]
		e1=end[z1]
		s2=start[z2]
		e2=end[z2]

		while(True):
			while(True):
				if(kmap_function[s1][s2]==0):
					ans=False
				if(s2==e2):
					s2=start[z2]
					break
				s2=(s2+1)%4
			if(s1==e1):
				break
			s1=(s1+1)%2

	
	tup=((start[z1],start[z2]),(end[z1],end[z2]),ans)
	return tup

#testcases

# L = [[1,'x','x',0],[0,1,'x',1],[1,1,'x',0],[1,'x',1,0]]; #initial testing list
# k = km.kmap(L); #defined the karnaugh map
# tup=is_legal_region(L,[1,1,0,2])
# k.draw_region(1,1,2,1,'green');
# k.mainloop()
# print(tup)

