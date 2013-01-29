# Collection View Error #

## Status ##

Not submitted

## Summary ##

When using UICollectionView to display cells with a UITextField, there seems to be a problem with the dequeuing process where it will force the text field to resign and draw the cell multiple times. This only appears to happen when the cell has a subview with a first responder and that cell is scrolled off screen. The dequeue process seems to create a new cell but still adding the old view. You can see this if the cell has a partially transparent background view.

![Example](http://f.cl.ly/items/412e233Z1q0O0y3b2821/Screen%20Shot%202013-01-29%20at%2011.54.16%20AM.png)

## Steps to Reproduce ##

1. Create a project with a UICollectionView.
2. Add a cell with a text field
3. Set the cell to have a partially transparent image
4. Scroll the collection view forcing it do dequeue and reuse.

## Expected Results ##

Cells should be added once and not have mysterious cells in the background.

## Actual Results ##

It appears that multiple cells are stacked behind the current cell.

## Regression ##

n/a

## Notes ##

n/a