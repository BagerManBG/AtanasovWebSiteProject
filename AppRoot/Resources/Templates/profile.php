<body>
        <!-- Temporary -->
        <link rel="stylesheet" type="text/css" href="../../CSS/Profile/profile.css">
        <link rel="stylesheet" type="text/css" href="../../CSS/reset.css">

        <!-- Temporary -->
          
        <section>
            <div class="profile">
                <div class="profileImage"> 
                    <img class="paperclip" src="../Images/Profile/paperclip.png">
                     <img class="avatar" src="../Images/ProfilePics/profile_default_image.jpg" >
                </div>
                
                <div class="profileInfo">
                    <div class= "profileHeader" >
                        <h2>Profile</h2>
                        
                    </div>
                    <div class="ProfileData">
                    <label>First Name</label>   
                    <input type="text" name="firstname" value="Firstname" disabled>                   
                    <label>Second Name</label>   
                    <input class="firstName" type="text"  value="Secondname"  disabled>
                    <label>Password</label>   
                    <input class="firstName" type="text"  value="Password"  disabled>
                    <label>Password Confirm</label>   
                    <input class="firstName" type="text"  value="Password Conf"  disabled>
                    </div>

                    <div class="buttons">
                        <button class="button" id="Edit">Edit</button>
                        <button class="button" id="Cancel">Cancel</button>
<!--                     <form action="../../Controllers/Account/profile.php" method="post">
 -->                        <button class="button" type="submit">Save</button>
<!--                     </form>            
 -->

                    </div>



                
                </div>    

                <div class="labels">
                        <label>First Name: <?php echo  "".$_SESSION['logged_user']['first_name']. "" ?> </label>
                        <label>Second Name: <?php echo  "".$_SESSION['logged_user']['last_name']. "" ?> </label>
                        <label>Email: <?php echo  "".$_SESSION['logged_user']['email']. "" ?> </label>
                        <label>Rank:  Noob </label> 

 
                </div> 
            </div>
        </section>
        <script src="../Libraries/JQuery/jquery.js"></script>
            <script src="../../JS/Profile/profile.js"></script>    
    </body>    