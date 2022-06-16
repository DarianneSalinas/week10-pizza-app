#  Custom TableView Cells Lab

/// * Created custom cells with truncating
* can include more design elements if desired
(include image of final running app results)


Keys:

* In storyboard, did the layout of the cell.
(include image of storyboard) 

* Set our class to match our custom subclass
(include image with messageTableViewCell and custom class named messageTableViewCell)

* Our custom subclass called MessageTableViewCell has all 4 of our outlets it needs. So that in our actual tableView controller it can reference them as it needs. 
(include image of MessageTableViewCell view controller that shows the 4 ib outlets)

* in our actual tableview, delegate, and datasource, we made sure to create the correct number of cells, made sure that we dequeue our resuable cell with the identifier of the tableview that we set as "MessageTableViewCell" for the appropriate indexPath

* Get our message out of the array and make sure that
    - it is a messageTableView cell (in this case it will always be because we don't have any other types of cells)
    - If we had other types of custom cells in this tableView, that we only are able to access these labels and this imageView if it is the correct type of cell

* Added a different type of cell and modified it to include a switch to toggle on or off
    - included a function for the toggling to indicate in the console whether the toggle button is on or off and outputing the toggle status as true or false 
