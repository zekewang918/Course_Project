# Course_Project

## Code Description

<p> 1. Code read both training and test files of x, y, and subject and use cbind to combine test files and train files into bigger data file called X_data, y_data, and subject_data </p>
<p> 2. Use grep function to find features that matches mean() and save the row num into mean </p>
<p> 3. Use grep function to find features that matches std() and save the row num into std </p>
<p> 4. Collect all row number that contains mean() and std() by combining mean and std </p>
<p> 5. Appropriately labels data in y_data by using activity_labels.txt </p>
<p> 6. Edit variable names </p>
<p> 7. Use cbind to combine X_data, y_data, and subject_data </p>
<p> 8. Use ddply and colMean() to generate a new variable that contains mean of each column </p>
<p> 9. Create a table that contains the mean of columns </p>
