# flutter_demo

This is a simple Flutter demo that allows importing various data using API and uses them throughout the application

## Getting Started

This application demo is divided into three stages.
The startup screen, login screen, and main page.

Before introducing each page, all color data and logo images for this application were imported from JSON files uploaded to the server. In addition, all String data was created and stored in the Strings.dart file for maintenance.

1. When you run the application, the logo and background color on the startup screen are all data from JSON files uploaded on the server.
![image](https://user-images.githubusercontent.com/50717623/110187233-9d00f300-7de5-11eb-826c-e026aa960596.png)


2. I added a simple validator function to this login screen. If you do not enter a valid email format or do not enter it at all, a warning message is output.
![image](https://user-images.githubusercontent.com/50717623/110187242-a8541e80-7de5-11eb-98d6-5314e06ab865.png)
![image](https://user-images.githubusercontent.com/50717623/110187250-b3a74a00-7de5-11eb-9eeb-5786ba720f42.png)

3. Finally, for the main page, I took Reddit's API and filled it with custom card widgets
4. ![image](https://user-images.githubusercontent.com/50717623/110187278-cfaaeb80-7de5-11eb-95f3-216a8ce5576e.png)

By using API, you can manage the application by modifying only JSON files without re-uploading the application when changes occur.
