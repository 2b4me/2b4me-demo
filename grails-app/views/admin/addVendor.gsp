<!DOCTYPE html>
<html lang="en">
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <title>2b4me.com - Admin - Add a Vendor</title>
      <g:external dir="css" file="bootstrap.css" />
      <g:external dir="css" file="boostrap-ext.css" />
   </head>
   <body>
      <div class="container-2">
         <g:include action="topMenu" />
         <div class="row second-row">
            <div class="span2 sidebar">
               <g:include action="sidebarMenu" />
            </div>
            <div class="span9">
               <form class="form-horizontal">
                  <fieldset>
                     <legend>Add a Vendor</legend>
                     <div class="control-group">
                        <label class="control-label" for="input01">Code</label>
                        <div class="controls">
                           <input type="text" class="input-xlarge" id="input01">
                           <p class="help-block">Vendor code, to uniquely identify it.</p>
                        </div>
                     </div>
                     <div class="control-group">
                        <label class="control-label" for="input01">Name</label>
                        <div class="controls">
                           <input type="text" class="input-xlarge" id="input01">
                           <p class="help-block">Name of the merchant.</p>
                        </div>
                     </div>
                     <div class="control-group">
                        <label class="control-label" for="input01">Address</label>
                        <div class="controls">
                           <input type="text" class="input-xlarge" id="input01">
                        </div>
                     </div>
                     <div class="control-group">
                        <label class="control-label" for="input01">&nbsp;</label>
                        <div class="controls">
                           <input type="text" class="input-xlarge" id="input01">
                        </div>
                     </div>
                     <div class="control-group">
                        <label class="control-label" for="input01">City</label>
                        <div class="controls">
                           <input type="text" class="input-xlarge" id="input01">
                        </div>
                     </div>
                     <div class="control-group">
                        <label class="control-label" for="input01">State</label>
                        <div class="controls">
                           <select name="state" id="select01" class="input-medium">
                              <option value="AL">Alabama</option>
                              <option value="AK">Alaska</option>
                              <option value="AZ">Arizona</option>
                              <option value="AR">Arkansas</option>
                              <option value="CA">California</option>
                              <option value="CO">Colorado</option>
                              <option value="CT">Connecticut</option>
                              <option value="DE">Delaware</option>
                              <option value="FL">Florida</option>
                              <option value="GA">Georgia</option>
                              <option value="HI">Hawaii</option>
                              <option value="ID">Idaho</option>
                              <option value="IL">Illinois</option>
                              <option value="IN">Indiana</option>
                              <option value="IA">Iowa</option>
                              <option value="KS">Kansas</option>
                              <option value="KY">Kentucky</option>
                              <option value="LA">Louisiana</option>
                              <option value="ME">Maine</option>
                              <option value="MD">Maryland</option>
                              <option value="MA">Massachusetts</option>
                              <option value="MI">Michigan</option>
                              <option value="MN">Minnesota</option>
                              <option value="MS">Mississippi</option>
                              <option value="MO">Missouri</option>
                              <option value="MT">Montana</option>
                              <option value="NE">Nebraska</option>
                              <option value="NV">Nevada</option>
                              <option value="NH">New Hampshire</option>
                              <option value="NJ">New Jersey</option>
                              <option value="NM">New Mexico</option>
                              <option value="NY">New York</option>
                              <option value="NC">North Carolina</option>
                              <option value="ND">North Dakota</option>
                              <option value="OH">Ohio</option>
                              <option value="OK">Oklahoma</option>
                              <option value="OR">Oregon</option>
                              <option value="PA">Pennsylvania</option>
                              <option value="RI">Rhode Island</option>
                              <option value="SC">South Carolina</option>
                              <option value="SD">South Dakota</option>
                              <option value="TN">Tennessee</option>
                              <option value="TX">Texas</option>
                              <option value="UT">Utah</option>
                              <option value="VT">Vermont</option>
                              <option value="VA">Virginia</option>
                              <option value="WA">Washington</option>
                              <option value="WV">West Virginia</option>
                              <option value="WI">Wisconsin</option>
                              <option value="WY">Wyoming</option>
                           </select>
                        </div>
                     </div>
                     <div class="control-group">
                        <label class="control-label" for="input01">Zip Code</label>
                        <div class="controls">
                           <input type="text" class="input-small" id="input01">
                        </div>
                     </div>
                     <div class="form-actions">
                        <button type="submit" class="btn btn-primary">Save</button>
                     </div>
                  </fieldset>
               </form>
            </div>
            <div class="span1">&nbsp;</div>
         </div>
      </div>
   </body>
   <g:external dir="js" file="jquery-1.7.2.js" />
   <g:external dir="js" file="bootstrap.js" />
   <g:external dir="js" file="bootstrap-ext.js" />
</html>