<!DOCTYPE html>
<html>
    <header>
        <title>Dylan's Twitter Project</title>
    </header>
    
    <head>
        <link href="http://dylanlane.koding.io:8888/styles.css" type="text/css" rel="stylesheet" />
        
        
    </head>
    
    <body background="https://abs.twimg.com/a/1435205969/img/t1/lohp_streams_header_bg_v4.png">
                
        <h1> Let's Hear Your Tweets </h1>
            
        <hr />   
        
        <form method="post">
            <p class="namebox"> 
                <textarea name="my_name" cols="50" rows="1" onfocus="if(this.value==this.defaultValue)this.value=''" onblur="if(this.value=='')this.value=this.defaultValue"style="overflow:hidden">Type your name...
                </textarea>
            </p>
            <p class="messagebox">
                <textarea name="tweet_me" cols="80" rows="8" onfocus="if(this.value==this.defaultValue)this.value=''" onblur="if(this.value=='')this.value=this.defaultValue" >Type your message here...
                </textarea>
            </p>
            <p class="tweetbutton">
                <button> Let's Tweet </button>
            </p>
        </form>
    
        <cfif structKeyExists(FORM,'tweet_me')>
        
            <p class="thanks">
                Thanks for Tweeting!!
            </p>
                    
        <cfquery datasource="the-db">
            INSERT INTO tweeting (
                tweet_user
                , tweet_date
                , tweet_message
            ) VALUES (
                '#FORM.my_name#'
                , CURRENT_TIMESTAMP
                , '#FORM.tweet_me#'
            )
        </cfquery>

        <br>
        
        <cfquery name="MyTweets" datasource="the-db">
            SELECT *
            FROM tweeting
                WHERE tweet_user = '#form.my_name#'
            ORDER BY 
                tweet_date DESC
        </cfquery>
        
        <hr /> 
        <br>
        
        <cfoutput>
                <cfloop query='MyTweets'>
                    <div class="results">
                        <p class="one">
                                <i>#MyTweets.tweet_user#'s thoughts at #TIMEFORMAT(tweet_date, "h:mm tt")# on #DATEFORMAT(tweet_date, "m/d")#...</i>
                        </p>    
                            
                        <p class="two">
                                #MyTweets.tweet_message#
                        </p>
                    </div>
                </cfloop>
        </cfoutput>
        
        </cfif>
    </body>
</html>
