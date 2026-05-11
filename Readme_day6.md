Day 6 read me

<img width="2486" height="1144" alt="image" src="https://github.com/user-attachments/assets/e60804ac-4a78-4d58-9e50-11c3fbafa7e4" />


Today we i have learned the structure and the alignment of the section the terraform i.e ..

** This the basic version/structure of the terraform **
** Similarly we can have /dev , /staging , /test environment separation declaration and module wise declaration like /networking, /vpc , /iam_polices , /files_storeage and so .... on....
- > main.tf -> where we have our main terrfaorm function written
- > backend.tf -> the backend modules are stored here 
- > provier.tf -> the provider details will be here declared.
- > varibale.tf -> the varibale declaration and assigned values will be stored here 
- > Similar way we have - > locals.tf, output.tf  
