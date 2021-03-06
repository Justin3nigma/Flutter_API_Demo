# flutter_demo

This is a simple Flutter demo that allows importing various data using API and uses them throughout the application

## Getting Started

This application demo is divided into three stages.
The startup screen, login screen, and main page.

Before introducing each page, all color data and logo images for this application were imported from JSON files uploaded to the server. In addition, all String data was created and stored in the Strings.dart file for maintenance.

1. When you run the application, the logo and background color on the startup screen are all data from JSON files uploaded on the server.
![image](https://user-images.githubusercontent.com/50717623/110187059-0cc2ae00-7de5-11eb-996f-d1cecf9c42ce.png)

2. I added a simple validator function to this login screen. If you do not enter a valid email format or do not enter it at all, a warning message is output.
![image](https://user-images.githubusercontent.com/50717623/110187077-19470680-7de5-11eb-878b-997270c363e3.png)
![image](https://user-images.githubusercontent.com/50717623/110187083-219f4180-7de5-11eb-8a54-2211625978a5.png)

3. Finally, for the main page, I took Reddit's API and filled it with custom card widgets
![image](https://user-images.githubusercontent.com/50717623/110187110-3380e480-7de5-11eb-8f6d-79dad8742bb0.png)

By using API, you can manage the application by modifying only JSON files without re-uploading the application when changes occur.
