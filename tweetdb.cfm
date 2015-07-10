<!---
<cfquery datasource="the-db">
            CREATE TABLE tweeting (
            id INT primary key auto_increment
            , tweet_user VARCHAR(50)
            , tweet_date VARCHAR(50)
            , tweet_message VARCHAR(140)
            )
</cfquery>            



<cfquery datasource="the-db">
            INSERT INTO tweeting (
                tweet_user
                , tweet_date
                , tweet_message
            ) VALUES (
                'Dylan'
                , 'CURRENT_TIMESTAMP'
                , 'Hopefully what im doing will makes lots of sense'
            )
</cfquery>

-----This deletes the whole table----
<cfquery name="MyTweets" datasource="the-db">
        DELETE FROM tweeting
</cfquery>

--->


<!DOCTYPE html>
<html>

    <head>
        <link href="http://dylanlane.koding.io:8888/styles.css" type="text/css" rel="stylesheet" />
    </head>
    
    <cfquery name="MyTweets" datasource="the-db">
                SELECT *
                FROM tweeting
            
    </cfquery>
    
    <h1>Tweet Database</h1>
    
    <table  border="5" bgcolor="#efefef">
    
        <tr class="titles">
            <th scope="col">Delete</th>
            <th scope+'col'>Message ID</th>
            <th scope="col">Username</th>
            <th scope="col">Tweet Date</th>
            <th scope="col">Tweet</th>
        </tr>
        
        
            
        <cfoutput>
            <cfloop query="MyTweets">
                <div class="tryingtodisplay">
                    <tr>
                        <td><input type="button" class="deletebutton" value="Delete" onclick="myfunction()"></td>
                        
                        <td>#MyTweets.id#</td>
                        <td>#MyTweets.tweet_user#</td>
                    
                        <td>#MyTweets.tweet_date#</td>
                    
                        <td>#MyTweets.tweet_message#</td>
                    </tr>
                </div>
            </cfloop>
        </cfoutput>
 
        <script>
            function myFunction() {
                <cfquery name="MyTweets" datasource="the-db">
                    DELETE FROM customer
                    WHERE id = "74"
                </cfquery>
            }    
        </script>    

        
    </table>
    
    
    
     <!---  
    <cfdump var="#MyTweets#" />
    --->